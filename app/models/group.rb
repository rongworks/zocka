class Group < ApplicationRecord
  belongs_to :user
  has_many :group_members
  has_many :users, through: :group_members
  has_many :group_game_entries
  has_many :game_entries, through: :group_game_entries

  alias_attribute :members, :users

  def add_member(user)
    group_members.build(user: user)
  end

  def add_game(game_entry)
    self.game_entries << game_entry
    self.save!
  end
end
