FactoryBot.define do
  factory :user do
    last_name { Faker::Lorem.characters(number:5) }
    first_name { Faker::Lorem.characters(number:5) }
    last_name_kana { Faker::Lorem.characters(number:5) }
    first_name_kana { Faker::Lorem.characters(number:5) }
    email_is_published { true }
    department { Faker::Lorem.characters(number:5) }
    position { Faker::Lorem.characters(number:5) }
    introduction { Faker::Lorem.characters(number:5) }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number:10) }
  end
end