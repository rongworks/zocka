FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'TestPass1234' }
  end
end
