FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    explain {Faker::Lorem.sentence}
    category_id {2}
    status_id {2}
    shipping_fee_id {2}
    prefecture_id {2}
    shipping_days_id {2}
    price {1500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
