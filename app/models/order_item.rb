class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  attr_accessible :quantity, :unit_price, :item_id, :order_id
  validates_presence_of :quantity, :unit_price
  after_create :detect_quantity_of_item

  def self.build_order_items(order, cart_items)
    ois = []
    cart_items.each do |item|
      oi = OrderItem.new
      oi.order = order
      oi.quantity = item[:order]
      oi.unit_price = item[:price]
      oi.item_id = item[:id]
      ois << oi
    end
    ois
  end

  def detect_quantity_of_item
    old_qnty = item.quantity
    item.quantity = old_qnty - quantity
    item.save
  end

  def name
    item.name
  end
end

