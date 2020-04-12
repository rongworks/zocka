FactoryBot.define do
  factory :recommendation do
    association :user
    association :game_entry
    owned { false }
    wanted { false }
    hated { false }
    platform { "MyString" }
  end
end
