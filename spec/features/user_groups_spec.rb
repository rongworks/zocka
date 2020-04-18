require 'rails_helper'

feature 'Managing groups' do
  let(:test_user){ FactoryBot.create(:user)}
  let(:group){ FactoryBot.create(:group, user: test_user) }

  before :each do
    sign_in(test_user)
  end

  scenario 'I can see games in my group' do
    3.times {FactoryBot.create(:game_entry)}

    visit game_entries_path
    expect(page).to have_css('.game_entry', count: 3)

    visit game_entries_path(group_id: group.id)
    expect(page).to have_css('.game_entry', count: 0)
  end

  scenario 'I can change my group listing' do
    3.times {FactoryBot.create(:game_entry)}
    game = GameEntry.first

    group.add_game(game)
    visit game_entries_path

    click_on group.name

    expect(page).to have_css('.title', count: 1, text: game.name)

  end

  scenario 'I can add games to my group' do
    game = FactoryBot.create(:game_entry)

    visit group_path(id: group.id)

    select game.name, from: 'game_entry_id'
    click_on 'commit', class: 'add_game'

    visit game_entries_path(group_id: group.id)
    expect(page).to have_css('.title', text: game.name)
  end

  scenario 'I can see my group votes' do
    game = FactoryBot.create(:game_entry)
    game.vote(score: -1, user: test_user)

    visit game_entries_path
    expect(page).to have_css('.score', text: "-1")
    group.add_game(game)

    visit game_entries_path(group_id: group.id)
    expect(page).to have_css('.score', text: "0")

    find(:href, 'upvote').click
    expect(page).to have_css('.score', text: "1")
  end

  scenario 'I can add new games for my group' do
    visit game_entries_path(group_id: group.id)

    expect(page).not_to have_css('.game_entry')
    click_on(class: 'new_game')

    fill_in 'game_entry_name', with: 'Test123'
    click_on 'commit'

    visit game_entries_path(group_id: group.id)
    expect(page).to have_css('.game_entry', text: 'Test123')
  end

  scenario 'I can add users' do
    user2 = FactoryBot.create(:user)

    visit group_path(id: group.id)
    select user2.username, from: 'user_id'
    click_on 'commit', class: 'add_user'
  end
end