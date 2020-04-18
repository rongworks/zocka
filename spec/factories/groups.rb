FactoryBot.define do
  factory :group do
    name { Faker::FunnyName.unique.name }
    association :user
    description { "MyText" }
  end
end
