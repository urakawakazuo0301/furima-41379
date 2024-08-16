class ItemsController < ApplicationController
  def index
  end

  def new
  end

  
  

  private

  def items_params
    params.require(:item).permit(:name, :description, :category_id, :item_condition_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

end
