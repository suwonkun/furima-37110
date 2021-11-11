class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :status
  belongs_to :category
  belongs_to :derivery_charge
  belongs_to :days_to_ship
  belongs_to :user
  # has_one :buy
  has_one_attached :image

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :image,presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :area_id, numericality: { other_than: 0 } 
  validates :status_id, numericality: { other_than: 0 } 
  validates :category_id, numericality: { other_than: 0 } 
  validates :derivery_charge_id, numericality: { other_than: 0 } 
  validates :days_to_ship_id, numericality: { other_than: 0 } 
 
end
