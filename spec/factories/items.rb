FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    product_name{Faker::Name.last_name}
    description {Faker::Lorem.sentence}
    price	{Faker::Number.between(from:300, to:9999999)}
    category_id	{Faker::Number.between(from:2, to:12)}
    condition_id	{Faker::Number.between(from:2, to:8)}
    delivery_charge_id	{Faker::Number.between(from:2, to:3)}
    prefecture_id	{Faker::Number.between(from:2, to:49)}
    days_to_ship_id {Faker::Number.between(from:2, to:4)}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
