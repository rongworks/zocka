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
end
