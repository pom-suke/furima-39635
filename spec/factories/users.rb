FactoryBot.define do
  factory :user do
    nickname              { 'テスト用User' }
    email                 { Faker::Internet.email }
    password = 'test01'
    password              { password }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '耕太' }
    kana_last_name        { 'タナカ' }
    kana_first_name       { 'コウタ' }
    birthday              { Faker::Date.birthday(min_age: 5, max_age: 93) }
  end
end
