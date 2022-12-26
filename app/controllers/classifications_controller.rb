class ClassificationsController < ApplicationController
  before_action :find_classification , only:[ :show , :edit ,:update ,:destroy ]
  before_action :find_store , only:[ :new, :create ,:index]


  def index
    @q = @store.classifications.ransack(params[:q])
    @classifications = @q.result
  end

  def new
    @classification = Classification.new
  end
  
  def create
    if @store.classifications.create(classification_params)
      redirect_to store_classifications_path , notice: '分類新增成功'  
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @classification.update(classification_params)
      redirect_to store_classifications_path({store: @classification.store}) , notice: '分類更新成功'
    else
      render :edit
    end
  end

  def destroy
    @classification.destroy
    redirect_to store_classifications_path , alert: '分類移除成功'
  end

private

  def classification_params
    params.require(:classification).permit(:name)
  end

  def find_classification
    @classification = Classification.find(params[:id])
  end

  def find_store
    @store = Store.find(params[:store_id])
  end

end
