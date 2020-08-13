FactoryBot.define do
  factory :user do
    nick_name              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {"中井"}
    first_name {"一真"}
    family_name_kana {"ナカイ"}
    first_name_kana {"カズマ"}
    birthday { Faker::Date.birthday }
  end
end