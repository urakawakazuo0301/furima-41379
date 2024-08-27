class OrderForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :city
    validates :block
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は無効です。次のように入力してください (例: 123-4567)' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は無効です。数字のみ入力してください' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
    order = Order.create(item_id:, user_id:)
    Buyer.create(postcode:, prefecture_id:, city:, block:, building:,
                 phone_number:, order_id: order.id)
  end
end
