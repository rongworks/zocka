FactoryBot.define do
  factory :game_entry do
    name { "MyString" }
    description { Faker::FunnyName.unique.name }
    game_url {"https://example.com"}
  end
end
