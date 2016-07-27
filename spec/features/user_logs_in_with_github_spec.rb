require "rails_helper"

RSpec.feature "User logs in with GitHub" do
  context "they use valid login credentials" do
    scenario "they are redirected to the homepage" do
      mock_auth_hash

      visit '/login'

      expect(page.status_code).to eq 200

      click_button "Sign in with GitHub"

      expect(current_path).to eq "/"
      expect(page).to have_content "Cool Guy"
      expect(page).to have_content "Logout"
    end
  end

  context "when an internal account with that email exists" do
    scenario "and they are redirected to login path" do
      user = create(:user, email: "coolguy@lithub.com", 
                    email_confirmation: "coolguy@lithub.com")

      mock_auth_hash

      visit '/login'

      click_button "Sign in with GitHub"

      expect(current_path).to eq "/login"

      within "#flash_error" do
        expect(page).to have_content "Invalid Github. Do you already have an account with us?"
      end
    end
  end
end
