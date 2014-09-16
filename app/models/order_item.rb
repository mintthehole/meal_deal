class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  attr_accessible :quantity, :unit_price, :item_id, :order_id
  validates_presence_of :quantity, :unit_price
  after_create :detect_quantity_of_item

  def detect_quantity_of_item
    old_qnty = item.quantity
    item.quantity = old_qnty - quantity
    item.save
  end
end

