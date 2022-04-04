require 'rails_helper'

RSpec.describe "Game Sets", type: :system do
  describe "GET /game_sets" do
    before :each do 
        @user = create(:user)
        login_as(@user)
    end

    it "renders game sets when visited" do
        visit "/game_sets"
        expect(page).to have_content("Game sets")
    end

    it "does nothing when the All game sets button is clicked" do
        visit "/game_sets"
        click_button "All game sets"
        expect(page).to have_content("Game sets")
    end       

    it "redners all game sets on main game sets page" do
        for n in 1..10 do
            create(:game_set, user: @user, name: "Game set #{n}")
        end

        visit "/game_sets"

        for n in 1..10 do 
            expect(page).to have_content("Game set #{n}")
        end
    end

    it "deletes a game set after the delete button is clicked", :js => true do
        for n in 1..3 do
            create(:game_set, user: @user, name: "Game set #{n}")
        end

        visit "/game_sets"

        for n in 1..3 do
            click_button('Delete', match: :first) 
            sleep 0.1
        end 

        for n in 1..3 do  
            expect(page).not_to have_content("Game set #{n}")
        end
    end

    it "renders the game set edit page after the edit button is clicked", :js => true do
        game_set = create(:game_set, user: @user, name: "test_game_set")

        visit "/game_sets"

        click_button('Edit', match: :first) 

        expect(page).to have_content("edit game set")
        expect(page).to have_current_path("/game_sets/#{game_set.id}/edit")
    end

    it "renders the game set page when the show button is clicked", :js => true do
        game_set = create(:game_set, user: @user, name: "test_game_set")

        visit "/game_sets"

        click_button('Show', match: :first) 
        expect(page).to have_content("Game set test_game_set")
        expect(page).to have_current_path("/game_sets/#{game_set.id}")
    end

    it "renders the new game set form after clicking the new game set button", :js => true do
        visit "/game_sets"

        click_button('New game set')

        fill_in 'name_field', :with => 'test_game_set_name'
        click_button "Create Game set"

        expect(page).to have_content("test_game_set_name")
    end

    it "allows the user to add games to a new game set", :js => true do
        game_set = create(:game_set, user: @user, name: "test_game_set")

        visit "/game_sets"
        click_button('Show', match: :first) 
        click_button('Add new game')

        expect( page ).to have_content("new game")

        click_button "Create Game"
        sleep 0.2

        expect(page).to have_content("Game #{Game.last.id}")
    end

    it "allows the user to delete games from a game set", :js => true do
        game_set = create(:game_set, user: @user, name: "test_game_set")
        for n in 1..3 
            create(:game, game_set: game_set)
        end

        visit "/game_sets"
        click_button('Show') 

        for n in 1..3 
            click_button('Destroy', match: :first) 
            sleep 0.1
        end

        expect(game_set.games.count).to eq(0)
    end
  end
end
