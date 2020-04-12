FactoryBot.define do
  factory :game_vote do
    association :game_entry
    association :user
    score { 1 }
    comment { "MyText" }
  end
end
