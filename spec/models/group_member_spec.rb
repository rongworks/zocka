require 'rails_helper'

RSpec.describe GroupMember, type: :model do
  let(:group_member){ FactoryBot.build(:group_member) }

  it 'is a user' do
    group_member.user = nil

    expect(group_member).to be_invalid
  end

  it 'belongs to  a group' do
    group_member.group = nil

    expect(group_member).to be_invalid
  end
end
