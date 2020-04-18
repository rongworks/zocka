class CreateGroupGameEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :group_game_entries do |t|
      t.references :game_entry, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
