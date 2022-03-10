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
  end
end
