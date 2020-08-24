class ShippingAddress < ApplicationRecord
  # association
  belongs_to :item

  # validation
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/.freeze }
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }
  end

  with_options numericality: { other_than: 1 } do
    validates :prefectures_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
