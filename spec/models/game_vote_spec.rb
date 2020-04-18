require 'rails_helper'

RSpec.describe GameVote, type: :model do
  let(:vote) { FactoryBot.build(:game_vote, comment: 'Bla') }

  it 'must have a user' do
    vote.user = nil
    expect(vote).to be_invalid
  end

  it 'must have a game entry' do
    vote.game_entry = nil
    expect(vote).to be_invalid
  end

  it 'has a score' do
    vote.score = 0
    expect(vote.score).to eq 0
  end

  it 'can have a comment' do
    vote.comment = 'Bla'
    expect(vote.comment).to eq 'Bla'
  end

  it 'can be scoped by Group' do
    vote.save!
    group1 = FactoryBot.create(:group)
    group2 = FactoryBot.create(:group)
    vote2 = FactoryBot.create(:game_vote, group: group1)
    vote3 = FactoryBot.create(:game_vote, group: group2)

    filtered = GameVote.grouped(group1)
    expect(filtered.count).to eq 1
    expect(filtered.first).to eq vote2

    no_filter = GameVote.grouped(nil)
    expect(no_filter.count).to eq 1
    expect(no_filter.first).to eq vote
  end

end
