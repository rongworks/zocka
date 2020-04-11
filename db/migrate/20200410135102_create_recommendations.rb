class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_entry, null: false, foreign_key: true
      t.boolean :owned
      t.boolean :wanted
      t.boolean :hated
      t.string :platform

      t.timestamps
    end
  end
end
