require 'rails_helper'

RSpec.describe "recommendations/index", type: :view do
  before(:each) do
    assign(:recommendations, [
      Recommendation.create!(
        user: nil,
        game_entry: nil,
        owned: false,
        wanted: false,
        hated: false,
        platform: "Platform"
      ),
      Recommendation.create!(
        user: nil,
        game_entry: nil,
        owned: false,
        wanted: false,
        hated: false,
        platform: "Platform"
      )
    ])
  end

  it "renders a list of recommendations" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "Platform".to_s, count: 2
  end
end
