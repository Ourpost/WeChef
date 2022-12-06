class MenusController < ApplicationController
before_action :find_menu , only:[ :show , :edit ,:update ,:destroy ]
before_action :find_store , only:[ :new, :create ,:index]


  def index
     @menus = @store.menus
  end

  def new
    # render html: params
    @menu = Menu.new

  end
  # create 因為有關連所以要用store的角度去建立
  # save 後面加驚嘆號就可以看到 save的錯誤
  def create
    # render html: params
    if @store.menus.create(menu_params)
      redirect_to store_menus_path , notice: '品項新增成功'  
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to store_menus_path , notice: '品項更新成功'
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to store_menus_path , alert: '品項移除成功'
  end

private

  def menu_params
    params.require(:menu).permit(:name , :price , :note , :photo , :delete_at , :quantity)
  end

  def find_menu
    @menu = Menu.find(params[:id])
  end

  def find_store
    @store = Store.find(params[:store_id])
  end

end
