class CreateGameVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :game_votes do |t|
      t.references :game_entry, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
