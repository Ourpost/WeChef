class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    # render html: params
    order = current_user.orders.new( 
      desk_id: params[:desk_id], 
      email: current_user.email, 
      amount: current_cart.total_price,
      items: params[:items],
      name: "NAME~"  
    )
    if order.save
      redirect_to checkout_order_path(id: order.serial)
    else
      redirect_to cart_path, alert: "訂單建立失敗"
    end
  end

  def checkout
    # render html: params
  end

end
