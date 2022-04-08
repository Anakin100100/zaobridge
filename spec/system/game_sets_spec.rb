# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Game Sets', type: :system do
  describe 'GET /game_sets' do
    before :each do
      @user = create(:user)
      login_as(@user)
    end

    it 'renders game sets when visited' do
      visit '/game_sets'
      expect(page).to have_content('Game sets')
    end

    it 'does nothing when the All game sets button is clicked' do
      visit '/game_sets'
      click_button 'All game sets'
      expect(page).to have_content('Game sets')
    end

    it 'redners all game sets on main game sets page' do
      (1..10).each do |n|
        create(:game_set, user: @user, name: "Game set #{n}")
      end

      visit '/game_sets'

      (1..10).each do |n|
        expect(page).to have_content("Game set #{n}")
      end
    end

    it 'deletes a game set after the delete button is clicked', js: true do
      (1..3).each do |n|
        create(:game_set, user: @user, name: "Game set #{n}")
      end

      visit '/game_sets'

      (1..3).each do |_n|
        click_button('Delete', match: :first)
        sleep 0.3
      end

      (1..3).each do |n|
        expect(page).not_to have_content("Game set #{n}")
      end
    end

    it 'renders the game set edit page after the edit button is clicked', js: true do
      game_set = create(:game_set, user: @user, name: 'test_game_set')

      visit '/game_sets'

      click_button('Edit', match: :first)

      expect(page).to have_content('Edit game set')
      expect(page).to have_current_path("/game_sets/#{game_set.id}/edit")
    end

    it 'renders the game set page when the show button is clicked', js: true do
      game_set = create(:game_set, user: @user, name: 'test_game_set')

      visit '/game_sets'

      click_button('Show', match: :first)
      expect(page).to have_content('Game set test_game_set')
      expect(page).to have_current_path("/game_sets/#{game_set.id}")
    end

    it 'renders the new game set form after clicking the new game set button', js: true do
      visit '/game_sets'

      click_button('New game set')

      fill_in 'name_field', with: 'test_game_set_name'
      click_button 'Create Game set'

      expect(page).to have_content('test_game_set_name')
    end

    it 'allows the user to add games to a new game set', js: true do
      game_set = create(:game_set, user: @user, name: 'test_game_set')

      visit '/game_sets'
      click_button('Show', match: :first)
      click_button('Add new game')

      expect(page).to have_content('new game')
    end

    it 'allows the user to delete games from a game set', js: true do
      game_set = create(:game_set, user: @user, name: 'test_game_set')
      (1..3).each do |_n|
        create(:game, game_set: game_set)
      end

      visit '/game_sets'
      click_button('Show')

      (1..3).each do |_n|
        click_button('Destroy', match: :first)
        sleep 0.1
      end

      expect(game_set.games.count).to eq(0)
    end

    it "allows the user to edit a game set's name", js: true do
      game_set = create(:game_set, user: @user, name: 'test_game_set')
      visit '/game_sets'

      click_button('Edit')
      fill_in 'name_field', with: 'changed_game_set_name'
      click_button('Update Game set')

      expect(page).to have_content('changed_game_set_name')
    end

    it "allows users to see game sets created by different users", js: true do
      @second_user = create(:user)
      game_set = create(:game_set, user: @user, name: 'test_game_set_created_by_user_1')
      login_as(@second_user)
      visit '/game_sets'
      expect(page).to have_content('test_game_set_created_by_user_1')
    end

    context "when creating a new game set" do
      before :each, js: true do 
        game_set = create(:game_set, user: @user, name: 'test_game_set')
        visit '/game_sets'
        click_button('Show', match: :first)
        click_button('Add new game')
      end
=begin
      it "allows the user to create a new game with the specified dealer", js: true do
        find("#game_dealer_e").set(true)
        click_button  'Create Game'
        expect(page).to have_content("Dealer: E")
      end
=end
    end
  end
end
