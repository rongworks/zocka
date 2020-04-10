class AddUrlToGameEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :game_entries, :game_url, :string
  end
end
