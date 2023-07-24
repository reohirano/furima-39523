FactoryBot.define do
  factory :item do
    

    name { Faker::Name.name }
    explain { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    condition_id { Faker::Number.between(from: 1, to: 6) }
    cost_id { Faker::Number.between(from: 1, to: 2) }
    area_id { Faker::Number.between(from: 1, to: 47) }
    d_day_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end