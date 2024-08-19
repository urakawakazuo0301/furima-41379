class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.includes(:user).order(created_at: :desc)
  end

  def show
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

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user_id == current_user.id
    @item.destroy
    redirect_to '/'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    return if user_signed_in? && current_user.id == @item.user_id

    redirect_to '/'
  end

  def items_params
    params.require(:item).permit(:name, :description, :category_id, :item_condition_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
