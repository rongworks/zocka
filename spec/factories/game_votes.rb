FactoryBot.define do
  factory :game_vote do
    game_entry { nil }
    user { nil }
    score { 1 }
    comment { "MyText" }
  end
end
