class CartsController < ApplicationController

  def show
    @desk = Desk.find_by(serial_number: params[:serial_number])
    # render html: current_cart.items
    @items = current_cart.items.map{|item| {menu_id: item.menu_id, quantity: item.quantity}}
  end

  def add
    # render html: params
    @desk = Desk.find_by(serial_number: params[:serial_number])
    current_cart.add_item(params[:id], params[:quantity], @desk.id, current_user.id)#TODO
    session[Cart::SessionKey] = current_cart.serialize

    redirect_to foods_path({serial_number: params[:serial_number]}), notice: "已加入購物車"
  end

  def destroy
    session[Cart::SessionKey] = nil
    redirect_to foods_path({serial_number: params[:serial_number]}), notice: "購物車已清空"
  end
end
