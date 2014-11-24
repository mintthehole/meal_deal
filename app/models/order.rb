class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, :through => :order_items
  attr_accessible :total_price, :user_id
  validates_presence_of :user_id
  after_create :send_sms
  def self.build_cart(session)
    cart = []
    total = 0
    session.each do |item_id, count|
      item = Item.find(item_id)
      item_price = item.price.to_f * count.to_f
      total += item_price
      cart << {:id => item_id, :name => item.name, :price => item.price, :order => count, :item_price => item_price}
    end
    return cart, total
  end

  def self.build_order(order_items, user)
    order = Order.new.tap do |order|
      order.user = user
      @cart, total_price = build_cart(order_items)
      order.total_price = total_price
    end
    order.order_items =  OrderItem.build_order_items(order, @cart)
    # order.save
    order
  end

  def item_with_quantity
    str = ""
    order_items.each do |oi|
      str += "#{oi.item.name} - #{oi.quantity} - #{oi.item.veg? ? 'Veg' : 'Non Veg'}" + "<br \>"
    end
    str.html_safe
  end

  def send_sms
    ModelMailer.oder_notification(self).deliver
    msg = "Thanks for ordering from currypots.com. Total Order Amout is #{total_price || 0}"
    user = User.last
    no = Phoner::Phone.parse(user.phone_no, :country_code => '91').to_s
    url = "http://bulkpush.mytoday.com/BulkSms/SingleMsgApi?feedid=345695&username=8904531501&password=jgaaw&To="+no+"&Text="+msg
    require 'net/http'
    result = Net::HTTP.get(URI.parse(URI.encode(url)))
  end

end
