class StoresController < ApplicationController
  before_action :find_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(stores_params)
    if @store.save
      redirect_to stores_path, notice = "商店新增成功" 
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
      redirect_to stores_path, notice = "商店編輯成功" 
    else
      render :new
    end 
  end

  def destroy
    @store.destroy
    redirect_to stores_path, notice = "商店刪除成功" 
  end

  private
  def stores_params
    params.require(:stores).permit(:name, :tel, :address, :business_hours_start, :business_hours_end, :logo)
  end

  def find_store
    @store = Store.find(params[:id])
  end
end
