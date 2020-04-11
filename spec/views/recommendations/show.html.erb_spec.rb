require 'rails_helper'

RSpec.describe "recommendations/show", type: :view do
  before(:each) do
    @recommendation = assign(:recommendation, Recommendation.create!(
      user: nil,
      game_entry: nil,
      owned: false,
      wanted: false,
      hated: false,
      platform: "Platform"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Platform/)
  end
end
