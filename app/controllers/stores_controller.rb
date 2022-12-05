class StoresController < ApplicationController
  before_action :authenticate_user! , only: [ :index ,:create ,:new]
  before_action :find_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = current_user.stores
  end

  def new
    @store = Store.new
  end

  def create
    # curre_user 如果沒有家 before_action :authenticate_user!就無法使用
    if current_user.stores.create(stores_params)
      redirect_to stores_path, notice: "商店新增成功" 
    else
      render :new
    end 
  end

  def show
  end

  def edit
  end

  def update
    if @store.update(stores_params)
      redirect_to stores_path, notice: "商店編輯成功" 
    else
      render :new
    end 
  end

  def destroy
    @store.destroy
    redirect_to stores_path, notice: "商店刪除成功" 
  end

  private
  def stores_params
    params.require(:store).permit(:name, :tel, :address, :business_hours_start, :business_hours_end, :logo)
  end

  def find_store
    @store = Store.find(params[:id])
  end
end
