class ItemsController < ApplicationController
  def index
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


  private

  def item_params
    params.require(:item).permit(
      :product, :describe, :category_id, :status_id, :pay_shipping_id, :prefecture_id, :until_shipping_id, :price, :image
    ).merge(user_id: current_user.id)
  end

end
