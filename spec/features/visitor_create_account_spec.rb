require 'rails_helper'

RSpec.feature "visitor can create an internal account" do
  context "valid credentials" do
    scenario "they are redirected to the user dashboard" do
      visit root_path

      click_on "Login"

      expect(current_path).to eq login_path

      click_on "Create Account"

      expect(current_path).to eq new_user_path

      fill_in "First Name", with: "Neight"
      fill_in "Last Name", with: "Aeighlen"
      fill_in "Email", with: "neightaeighlen@test.com"
      fill_in "Email Confirmation", with: "neightaeighlen@test.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      fill_in "Phone Number", with: "123-456-7890"
      click_on "Create Account"

      expect(current_path).to eq dashboard_path
      within "#flash_success" do
        expect(page).to have_content "Welcome To Cubby Stuffers!"
      end
    end
  end
end
