require 'rails_helper'

RSpec.describe "game_entries/edit", type: :view do
  before(:each) do
    @game_entry = assign(:game_entry, GameEntry.create!(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders the edit game_entry form" do
    render

    assert_select "form[action=?][method=?]", game_entry_path(@game_entry), "post" do

      assert_select "input[name=?]", "game_entry[name]"

      assert_select "textarea[name=?]", "game_entry[description]"
    end
  end
end
