require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group){ FactoryBot.build(:group) }

  it 'has members' do
    expect(group.members).to be_blank
    group.save!

    FactoryBot.create(:group_member, group: group)

    expect(group.reload.members).to be_present
  end

  it 'can add members' do
    user = FactoryBot.build(:user)
    group.add_member(user)

    expect(group.members).to include(user)
  end

  it 'can add games' do
    game = FactoryBot.create(:game_entry)

    group.add_game(game)

    expect(group.game_entries.count).to eq(1)
  end
end
