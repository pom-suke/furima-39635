class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :edit, :update]
  before_action :authenticate_user!, only:[:new, :edit, :destroy]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user == item.user
      item.destroy
    end
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(
      :product, :describe, :category_id, :status_id, :pay_shipping_id, :prefecture_id, :until_shipping_id, :price, :image
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user != @item.user || Order.sold?(@item.id)
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
