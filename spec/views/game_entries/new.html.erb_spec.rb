require 'rails_helper'

RSpec.describe "game_entries/new", type: :view do
  before(:each) do
    assign(:game_entry, GameEntry.new(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders new game_entry form" do
    render

    assert_select "form[action=?][method=?]", game_entries_path, "post" do

      assert_select "input[name=?]", "game_entry[name]"

      assert_select "textarea[name=?]", "game_entry[description]"
    end
  end
end
