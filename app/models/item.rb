class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one    :order

  belongs_to :category
  belongs_to :area
  belongs_to :condition
  belongs_to :cost
  belongs_to :d_day

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :area_id
    validates :d_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :area_id
    validates :condition_id
    validates :cost_id
    validates :d_day_id
  end
end