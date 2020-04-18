class GroupGameEntry < ApplicationRecord
  belongs_to :group
  belongs_to :game_entry
end
