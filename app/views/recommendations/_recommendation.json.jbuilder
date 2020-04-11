json.extract! recommendation, :id, :user_id, :game_entry_id, :owned, :wanted, :hated, :platform, :created_at, :updated_at
json.url recommendation_url(recommendation, format: :json)
