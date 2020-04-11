FactoryBot.define do
  factory :recommendation do
    user { nil }
    game_entry { nil }
    owned { false }
    wanted { false }
    hated { false }
    platform { "MyString" }
  end
end
