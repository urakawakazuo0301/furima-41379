class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  has_one_attached :image


  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "Category can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "Item Condition can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "Shipping Cost can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "Prefecture can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "Shipping Date can't be blank"}
  
  with_options format: { with: /\A[0-9]+\z/, message: "Price is not a number" } do
    validates :price, numericality: { greater_than: 300, less_than: 9999999 }
  end

end
