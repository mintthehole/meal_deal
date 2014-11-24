class HomeController < ApplicationController

  def index
    @item_categories = ItemCategory.all
  end

  def terms

  end
end
