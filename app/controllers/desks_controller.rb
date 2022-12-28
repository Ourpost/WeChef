class DesksController < ApplicationController
  before_action :find_store, only: [:new, :create, :update, :destroy ,:show]
  before_action :find_desk, only: [:edit, :update, :destroy, :show]
  before_action :generate_qrcode, only: [:show]

  def new
    @desk = Desk.new
  end

  def create
    if @store.desks.create(desk_params)
      redirect_to store_path(@store) , notice: '桌位新增成功'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @desk.update(desk_params)
      redirect_to store_path(@store) , notice: '桌位編輯成功'
    else
      render :new
    end
  end

  def destroy
    @desk.destroy
    redirect_to store_path(@store) , notice: '桌位刪除成功'
  end



  private
  def find_store
    @store = Store.find(params[:store_id])
  end

  def find_desk
    @desk = Desk.find(params[:id])
  end

  def desk_params
    params.require(:desk).permit(:name, :seat_amount, :serial_number)
  end

  def generate_qrcode
    # qrcode = RQRCode::QRCode.new("localhost:3000/foods?serial_number=#{@desk.serial_number}")
    qrcode = RQRCode::QRCode.new("https://wechef.herokuapp.com/foods?serial_number=#{@desk.serial_number}")
    @qrcode = qrcode.as_svg(color: :black, offset: 15, shape_rendering: "optimizeSpeed", module_size: 8).html_safe
  end

end
