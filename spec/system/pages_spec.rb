require 'rails_helper'

RSpec.describe "Pages", type: :system do
  describe "GET /index" do

    it "renders the index page if the user is logged in" do      
      login_as(create(:user))
      visit root_path
      expect(page).to have_content("Zaobridge")
    end

    it "redirects to the login page if the user is not logged in" do
        visit root_path
        expect(page).to have_content("Log In")
    end

    it "renders main content when a logged in user visits the root path" do
      login_as(create(:user))
      visit root_path
      expect(page).to have_content("main page")
    end

    it "loggs out the currently logged in user after clicking the logout button" do
      login_as(create(:user))
      visit root_path
      click_button "Logout"
      expect(page).to have_content("Log In")
    end

  end
end
