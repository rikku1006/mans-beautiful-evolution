FactoryBot.define do
  factory :comment do
    text { "テスト" }
    association :user
    association :product_review
  end
end
