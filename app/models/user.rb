class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :game_votes
  has_many :groups

  before_save :set_username

  def to_s
    username
  end

  private

  def set_username
    self.username = email unless username
  end
end
