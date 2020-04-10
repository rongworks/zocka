class GameVote < ApplicationRecord
  belongs_to :game_entry
  belongs_to :user
end
