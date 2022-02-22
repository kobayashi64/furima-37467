FactoryBot.define do
  factory :purchase_delivery do
    post_code { '123-4567' }
    prefecture_id	{ Faker::Number.between(from: 2, to: 49) }
    city { '横浜市緑区' }
    address	{ '青山1-1-1' }
    telephone_number	{ Faker::Number.number(digits: 11) }
    token { '1234abcd' } 
    
  end
end
