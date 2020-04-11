require 'rails_helper'

RSpec.describe "recommendations/edit", type: :view do
  before(:each) do
    @recommendation = assign(:recommendation, Recommendation.create!(
      user: nil,
      game_entry: nil,
      owned: false,
      wanted: false,
      hated: false,
      platform: "MyString"
    ))
  end

  it "renders the edit recommendation form" do
    render

    assert_select "form[action=?][method=?]", recommendation_path(@recommendation), "post" do

      assert_select "input[name=?]", "recommendation[user_id]"

      assert_select "input[name=?]", "recommendation[game_entry_id]"

      assert_select "input[name=?]", "recommendation[owned]"

      assert_select "input[name=?]", "recommendation[wanted]"

      assert_select "input[name=?]", "recommendation[hated]"

      assert_select "input[name=?]", "recommendation[platform]"
    end
  end
end
