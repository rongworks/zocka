json.extract! game_entry, :id, :name, :description, :created_at, :updated_at
json.url game_entry_url(game_entry, format: :json)
