require "rails_helper"

RSpec.feature "User logs in with GitHub" do
  before do
    mock_auth_hash
  end
  context "they use valid login credentials" do
    scenario "they are redirected to the homepage" do
      visit '/login'

      expect(page.status_code).to eq 200

      click_button "Sign in with GitHub"

      expect(current_path).to eq "/"
      expect(page).to have_content "Cool Guy"
      expect(page).to have_content "Logout"
    end
  end
end
