class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, :through => :order_items
  attr_accessible :total_price, :user_id
  validates_presence_of :user_id

  def self.build_cart(session)
    cart = []
    total = 0
    session[:order].each do |item_id, count|
      item = Item.find(item_id)
      item_price = item.price.to_f * count.to_f
      total += item_price
      cart << {:name => item.name, :price => item.price, :order => count, :item_price => item_price}
    end
    return cart, total
  end
end
