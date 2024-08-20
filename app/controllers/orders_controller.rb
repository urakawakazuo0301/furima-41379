class OrdersController < ApplicationController

  def index
    @buyer_order = BuyerOrder.new
  end

  def create
    @buyer_order = BuyerOrder.new(order_params)
    if @buyer_order.valid?
      @buyer_order.save
      redirect_to '/'
    else
      render "/", status: unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:buyer_order).permit(:postcode, :prefecrute_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: item_id)
  end

end
