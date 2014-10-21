class HomeController < ApplicationController
  def index
    @item_categories = ItemCategory.all
  end
end
