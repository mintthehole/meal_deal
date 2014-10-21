class Item < ActiveRecord::Base
  attr_accessible :name, :price, :quantity, :item_category_id,:veg
  validates_presence_of  :name, :price, :quantity,:item_category_id
  belongs_to :item_category
end
