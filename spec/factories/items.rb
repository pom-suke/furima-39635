FactoryBot.define do
  factory :item do
    product           { 'test(テスト)用商品' }
    describe          { 'これはtest(テスト)用商品です。' }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    status_id         { Faker::Number.between(from: 2, to: 7) }
    pay_shipping_id   { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    until_shipping_id { Faker::Number.between(from: 2, to: 4) }
    price             { '9999' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
