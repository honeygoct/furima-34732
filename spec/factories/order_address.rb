FactoryBot.define do
  factory :orderaddress do
    postal_code {123-4567}
    prefecture_id {2}
    city {"横浜市緑区"}
    house_number{"青山1-1-1"}
    building{"柳ビル１０３"}
    phone_number{01000000000}
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end
