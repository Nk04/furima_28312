FactoryBot.define do
  factory :shipping_address do
    postal_code    { '123-4567' }
    city           { '大阪' }
    house_number   { '平野区長吉' }
    phone_number   { 0o0011112222 }
    prefectures_id { 2 }
    association :item
  end
end
