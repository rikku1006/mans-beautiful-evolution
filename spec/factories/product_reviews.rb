FactoryBot.define do
  factory :product_review do
    product_name                { '森林の化粧水' }
    category_id                 { 2 }
    review_comment              { 'テスト'}

    association :user

    after(:build) do |product_review|
      product_review.image.attach(io: File.open('public/images/test_furima.png'), filename: 'test_furima.png')
    end
  end
end
