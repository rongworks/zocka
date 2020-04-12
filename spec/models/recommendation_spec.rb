require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  let(:recommendation) { FactoryBot.build(:recommendation) }

  it 'needs a user' do
    recommendation.user = nil
    expect(recommendation).to be_invalid
  end

  it 'needs a game_entry' do
    recommendation.game_entry = nil
    expect(recommendation).to be_invalid
  end

  it 'can show the platform' do
    recommendation.platform = 'PC'
    expect(recommendation.platform).to eq 'PC'
  end
end
