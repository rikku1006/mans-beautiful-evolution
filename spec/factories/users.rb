FactoryBot.define do
  factory :user do
    nickname              {'r'}
    email                 { Faker::Internet.free_email }
    password              {'e3w2q1'}
    password_confirmation {password}
  end
end