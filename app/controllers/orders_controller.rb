# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :find_desk, only: [:create]
  before_action :find_order, only: %i[destroy pay serve]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: %i[checkout response]

  def create
    order = current_user.orders.new(
      desk_id: params[:desk_id],
      email: current_user.email,
      amount: current_cart.total_price,
      items: params[:items],
      name: current_user.nickname

    )

    if order.save
      new_order = render_to_string partial: 'stores/order', locals: { order: }
      DesksChannel.broadcast_to(@desk, new_order)
      redirect_to checkout_order_path(id: order.serial)
    else
      redirect_to cart_path, alert: '訂單建立失敗'
    end
  end

  def destroy
    @order.destroy
  end

  def pay
    return unless @order.may_pay?

    @order.pay!
  end

  def serve
    return unless @order.paid?

    @order.serve!
  end

  def order_state
    @state = Order.find(params[:id]).aasm_state
    render json: { state: @state }
  end

  def checkout
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
