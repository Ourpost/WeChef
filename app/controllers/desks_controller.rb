class DesksController < ApplicationController
  before_action :find_store, only: [:index, :new, :create]
  before_action :find_desk, only: [:edit, :update, :destroy, :show]



  def index
    @desks = @store.desks
  end

  def new
    @desk = Desk.new
  end

  def create
    if @store.desks.create(desk_params)
      redirect_to store_desks_path , notice: '桌位新增成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @desk.update(desk_params)
      redirect_to store_desks_path , notice: '桌位編輯成功'
    else
      render :new
    end
  end

  def destroy
    @desk.destroy
    redirect_to store_desks_path , notice: '桌位刪除成功'
  end

  private
  def find_store
    @store = Store.find(params[:store_id])
  end

  def find_desk
    @desk = Desk.find(params[:id])
  end

  def desk_params
    params.require(:desk).permit(:name, :seat_amount)
  end
end
