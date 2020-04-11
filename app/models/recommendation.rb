class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :game_entry
end
