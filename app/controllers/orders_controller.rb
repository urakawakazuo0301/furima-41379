class OrdersController < ApplicationController
  

  def index
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      @orderform.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
end
