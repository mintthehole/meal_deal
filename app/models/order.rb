class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, :through => :order_items
  attr_accessible :total_price, :user_id
  validates_presence_of :user_id
end
