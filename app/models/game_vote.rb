class GameVote < ApplicationRecord
  belongs_to :game_entry
  belongs_to :user
  belongs_to :group, optional: true

  scope :grouped, -> (group) {where(group: group)}

end
