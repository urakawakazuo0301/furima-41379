class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to '/'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :category_id, :item_condition_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
