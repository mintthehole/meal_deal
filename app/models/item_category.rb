class ItemCategory < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :items
end
