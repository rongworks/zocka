require 'rails_helper'

feature "Managing game entries", type: :feature do
  let(:test_user){ FactoryBot.create(:user) }

  before :each do
    sign_in(test_user)
  end

  scenario 'I can see game entries' do
    game_entries = [FactoryBot.create(:game_entry, name: 'Game1'), FactoryBot.create(:game_entry, name: 'Game2')]
    visit game_entries_path

    expect(page).to have_css('.title', text: game_entries[0].name)
    expect(page).to have_css('.title', text: game_entries[1].name)
  end

  scenario 'Games are ranked by default' do
    game1 = FactoryBot.create(:game_entry, name: 'Game1')
    game2 = FactoryBot.create(:game_entry, name: 'Game2')

    vote(game2.id, 'upvote')
    visit game_entries_path

    first_game = page.first('.game_entry')
    expect(first_game).to have_css('.title', text: game2.name)
  end

  scenario 'I can add new entries' do
    visit new_game_entry_path
    fill_in 'game_entry_name', with: 'My Game'
    fill_in 'game_entry_description', with: 'My Description'
    click_on 'commit'

    expect(current_path).to eq game_entries_path
    expect(page).to have_css('.title', text: 'My Game')
  end

  scenario 'I can edit entries' do
    game_entry = FactoryBot.create(:game_entry, name: "NotThis")
    visit edit_game_entry_path(game_entry)
    fill_in 'game_entry_name', with: 'My Game'
    fill_in 'game_entry_description', with: 'My Description'
    click_on 'commit'

    expect(current_path).to eq game_entries_path
    expect(page).to have_css('.title', text: 'My Game')
    expect(page).not_to have_css('.title', text:'NotThis')
  end

  context 'Voting for games' do
    let(:game_entries){ [FactoryBot.create(:game_entry, name: 'Game1'), FactoryBot.create(:game_entry, name: 'Game2')] }

    scenario 'I can vote for a game' do
      game = game_entries.first

      vote(game.id, 'upvote')

      expect(game_score(game.id)).to eq "1"
    end

    scenario 'I can downvote a game' do
      game = game_entries.first

      vote(game.id, 'downvote')

      expect(game_score(game.id)).to eq "-1"
    end

    scenario 'Only 1 vote remains, when voting multiple times' do
      game = game_entries.first

      vote(game.id, 'upvote')
      expect(game_score(game.id)).to eq "1"

      vote(game.id, 'upvote')
      expect(game_score(game.id)).to eq "1"
    end
  end

  def vote(game_id, vote_link)
    game_selector = ".game_#{game_id}"
    visit game_entries_path

    within(game_selector) do
      find(:href, vote_link).click
    end
  end

  def game_score(game_id)
    page.find(".game_#{game_id}").find('.score').text
  end
end