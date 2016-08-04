require 'rails_helper'

RSpec.feature "visitor can create an internal account" do
  context "valid credentials" do
    scenario "they are redirected to the user dashboard" do
      cubby = create(:cubby)

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

      expect(current_path).to eq new_user_cubby_path(User.last)

      within ".alert" do
        expect(page).to have_content "Welcome To Cubby Stuffers!"
      end

      within "#content" do
        expect(page).to have_content "Please select a cubby:"
      end

      location, column, row = "Big Workspace", "A", "1"

      select(location, from: "cubby_location")
      select(column, from: "cubby_column")
      select(row, from: "cubby_row")

      click_button "Register Cubby"

      expect(current_path).to eq (dashboard_path)

      within ".alert" do
        expect(page).to have_content "Sucessfully Registered Cubby!"
      end

      within("nav") do
        expect(page).to have_content("Neight")
        expect(page).to_not have_content("Login")
        expect(page).to have_content("Logout")
      end

      within("#content") do
        expect(page).to have_content("Your Cubby: Big Workspace A1")
      end
    end
  end
end
