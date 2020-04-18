class AddGroupToGameVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :game_votes, :group, null: true, foreign_key: true
  end
end
