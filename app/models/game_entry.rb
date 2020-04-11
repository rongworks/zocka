class GameEntry < ApplicationRecord
  has_many :game_votes, dependent: :destroy
  has_many :recommendations, dependent: :destroy

  validates :name, presence: true

  def upvotes
    game_votes.all.select { |v| v.score > 0 }
  end

  def downvotes
    game_votes.all.select { |v| v.score <= 0}
  end

  def score
    return 0 if game_votes.blank?
    game_votes.sum(&:score)
  end

  def game_link
    sanitized_name = name.gsub(' ', '+')
    return game_url.blank? ? "https://www.igdb.com/search?utf8=%E2%9C%93&type=1&q=#{sanitized_name}" : game_url
  end

  def owner_count
    recommendations.all.select { |r| r.owned? }.count
  end

  def wishlist_count
    recommendations.all.select { |r| r.wanted? }.count
  end
end
