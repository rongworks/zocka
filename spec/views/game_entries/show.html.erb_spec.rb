require 'rails_helper'

RSpec.describe "game_entries/show", type: :view do
  before(:each) do
    @game_entry = assign(:game_entry, GameEntry.create!(
      name: "Name",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
