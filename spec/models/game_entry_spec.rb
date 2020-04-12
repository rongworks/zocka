require 'rails_helper'

RSpec.describe GameEntry, type: :model do
  let(:game_entry) { FactoryBot.build(:game_entry) }

  it 'must have a name' do
    expect(game_entry).to be_valid

    game_entry.name = nil

    expect(game_entry).to be_invalid
  end

  it 'can have a game_url or gets a default url' do
    expect(game_entry.game_link).to include("example.com")
    game_entry.game_url = ''
    expect(game_entry.game_link).to include("igdb.com")
  end

  it 'has a score' do
    expect(game_entry.score).to eq 0
  end

  context 'voting' do
    it 'can be upvoted' do
      user = FactoryBot.create(:user)
      game_entry.save!
      game_entry.vote(1, user)
      expect(game_entry.score).to eq 1
    end

    it 'can be downvoted' do
      user = FactoryBot.create(:user)
      game_entry.save!
      game_entry.vote(-1, user)
      expect(game_entry.score).to eq -1
    end
  end

end
