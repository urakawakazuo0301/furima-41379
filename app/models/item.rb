class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  has_many_attached :images
  belongs_to :user
  has_one :order

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message:"は1枚以上5枚以下にしてください" }
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }

  with_options format: { with: /\A[0-9]+\z/, message: "can't be blank" } do
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
  end
end
