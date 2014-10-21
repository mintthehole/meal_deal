class OrdersController < InheritedResources::Base
  before_filter :authenticate_user!

  def add_to_cart
    session[:order] ||= {}
    session[:order][params[:item_id]] = params[:order]
    @cart_hash, @total = Order.build_cart(session[:order])
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
