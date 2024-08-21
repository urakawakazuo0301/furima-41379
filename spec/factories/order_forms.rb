FactoryBot.define do
  factory :order_form do
    user_id           { Faker::Number.non_zero_digit }
    item_id           { Faker::Number.non_zero_digit }
    postcode          { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    city              { Faker::Address.city }
    block             { Faker::Address.street_address }
    building          { Faker::Address.street_address }
    phone_number      { Faker::Number.leading_zero_number(digits: 11) }
    token             { "tok_abcdefghijk00000000000000000" }
  end
end