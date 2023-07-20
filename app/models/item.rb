class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
 
  belongs_to :category
  belongs_to :delivery_area
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date
  
end
