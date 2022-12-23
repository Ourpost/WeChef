class CartsController < ApplicationController

  def show
    # render html: current_cart.items[1].quantity
    @desk = Desk.find_by(serial_number: params[:serial_number])
    @nickname = current_user ? current_user.nickname : "親愛的顧客"
    @items = current_cart.items.map{|item| {menu_id: item.menu_id, quantity: item.quantity}}
  end

  def add
    # render html: params
    if current_user 
      @desk = Desk.find_by(serial_number: params[:serial_number])
      current_cart.add_item(params[:id], params[:quantity])
      session[Cart::SessionKey] = current_cart.serialize
  
      redirect_to foods_path({serial_number: params[:serial_number]}), notice: "已加入購物車"
    else
      redirect_to user_session_path, alert: "請先登入"
    end

  end

  def destroy
    session[Cart::SessionKey] = nil
    redirect_to foods_path({serial_number: params[:serial_number]}), notice: "購物車已清空"
  end
end
