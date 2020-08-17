FactoryBot.define do
  factory :item do
    name               { 'test' }
    comment            { 'explanation' }
    category_id        { 2 }
    status_id          { 2 }
    delivery_fee_id    { 2 }
    shipping_origin_id { 2 }
    shipping_date_id   { 2 }
    price              { 300 }
    association :user
  end
end
