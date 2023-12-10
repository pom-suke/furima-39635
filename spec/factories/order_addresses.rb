FactoryBot.define do
  factory :order_address do
    post_code     { '123-9876' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { '戸田市' }
    house_number  { '美女木1-1-1' }
    building_name { 'ホワイトハイツ555' }
    phone_number  { '09098765432' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
