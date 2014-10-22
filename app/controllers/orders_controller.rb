class OrdersController < InheritedResources::Base
  before_filter :authenticate_user!

  def add_to_cart
    if params[:available_quantity] < params[:order]
      @invalid_input = true
    else
      session[:order] ||={}
      session[:order][params[:item_id]] = params[:order]
      p session[:order]
      @cart_hash, @total = Order.build_cart(session[:order])
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    @order = Order.save_item(session[:order], current_user)
    flash[:notice] = "Order Placed successfully"
    redirect_to root_path
  end
end
