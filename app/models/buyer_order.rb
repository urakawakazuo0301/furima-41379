class BuyerOrder

  include ActiveModel::Model
  attr_accessor :postcode, :prefecrute, :city, :bolck, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :city
    validates :block
    validates :prhone_number
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :phone_number, format: {with: /\A\d{11}\z/, message:"is invalid. Input only number"}
    validates :user_id
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postcode: postcode, prefecrute_id: prefecrute_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
