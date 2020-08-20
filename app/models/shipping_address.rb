class ShippingAddress < ApplicationRecord
  # association
  belongs_to :item
end
