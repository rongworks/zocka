require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  it 'gets a default username' do
    user.username = nil
    user.save!
    user.reload

    expect(user.username).to eq user.email
  end
end
