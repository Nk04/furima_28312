class Item < ApplicationRecord
  #association
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_date

  #validation
  with_options presence: true do
    validates :name
    validates :comment
    validates :category
    validates :status
    validates :delivery_fee
    validates :shipping_origin
    validates :shipping_date
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipping_origin_id
    validates :shipping_date_id
  end
end
