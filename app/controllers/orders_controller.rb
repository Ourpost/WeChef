class OrdersController < ApplicationController
  before_action :find_desk, only: [:create]
  before_action :find_order, only: [:destroy, :pay, :serve]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:checkout, :response]

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
      new_order = render_to_string partial: "stores/order", locals: { order: order}
      DesksChannel.broadcast_to(@desk, new_order)
      redirect_to checkout_order_path(id: order.serial)
    else
      redirect_to cart_path, alert: "訂單建立失敗"
    end
  end

  def destroy
    @order.destroy
  end

  def pay
    if @order.may_pay?
      @order.pay!
    end
  end

  def serve
    if @order.paid?
      @order.serve!
    end
  end

  def order_state
    @state = Order.find(params[:id]).aasm_state
    @state
    render json: {state: @state}
  end

  def checkout

    # render html: params
    @order = Order.find_by(serial: params[:id])
    @form_info = Newebpay::Mpg.new(@order).form_info
    @form_MerchantID = @form_info[:MerchantID]
    @form_TradeInfo = @form_info[:TradeInfo]
    @form_TradeSha = @form_info[:TradeSha]

  end

  private
  def find_desk
    @desk = Desk.find(params[:desk_id])
  end
  def find_order
    @order = Order.find(params[:id])
  end

end
