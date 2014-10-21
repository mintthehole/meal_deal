class OrdersController < InheritedResources::Base

  def add_to_cart
    session[:order] ||= {}
    session[:order][params[:item_id]] = params[:order]
    @cart_hash, @total = Order.build_cart(session)
    respond_to do |format|
      format.js
    end
  end
end
