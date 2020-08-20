class Item < ApplicationRecord
  # association
  belongs_to :user
  has_one_attached :image
  has_one :shipping_addresses


  # validation
  with_options presence: true do
    validates :name
    validates :image
    validates :comment
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipping_origin_id
    validates :shipping_date_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_date
end
