require 'rails_helper'

RSpec.describe "game_entries/index", type: :view do
  before(:each) do
    assign(:game_entries, [
      GameEntry.create!(
        name: "Name",
        description: "MyText"
      ),
      GameEntry.create!(
        name: "Name",
        description: "MyText"
      )
    ])
  end

  it "renders a list of game_entries" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
