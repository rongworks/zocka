class GameEntry < ApplicationRecord
  has_many :game_votes, dependent: :destroy
  has_many :recommendations, dependent: :destroy
  has_many :group_game_entries
  has_many :groups, through: :group_game_entries

  validates :name, presence: true

  scope :ranked, -> { sort_by(&:score).reverse! }
  scope :grouped, -> (group) {group.game_entries if group}

  def upvotes(group = nil)
    game_votes.grouped(group).select { |v| v.score > 0 }
  end

  def downvotes(group = nil)
    game_votes.grouped(group).select { |v| v.score <= 0}
  end

  def vote(score:, user:, group: nil, comment: '')
    vote = self.game_votes.find_by(user_id: user.id, group: group) || GameVote.new(user: user,
                                                                                   game_entry: self,
                                                                                   score: score,
                                                                                   group: group)
    vote.score = score
    vote.save!
  end

  def score(group = nil)
    return 0 if game_votes.grouped(group).blank?
    game_votes.grouped(group).sum(&:score)
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
