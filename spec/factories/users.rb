FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.unique.email }
    password              { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '漢字' }
    first_name            { 'ひらがな' }
    last_name_kana        { 'カタカナ' }
    first_name_kana       { 'カタカナ' }
    birthday              { Faker::Date.birthday }
  end
end
