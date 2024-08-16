class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date


  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "Category can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "Item Condition can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "Shipping Cost can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "Prefecture can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "Shipping Date can't be blank"}
  validates :price, presence: true
  
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
    presence: { message: "Price can't be blank" }
  end
end
