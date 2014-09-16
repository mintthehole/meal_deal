class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    @categories = ItemCategory.all
    @item_lists = {}
    @categories.each do |cat|
      items = Item.where(:item_category_id => cat.id)
      if items.present?
        @item_lists[cat.name] = items
      end
    end
  end
end