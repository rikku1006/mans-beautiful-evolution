FactoryBot.define do
  factory :comment do
    text { "ใในใ" }
    association :user
    association :product_review
  end
end
