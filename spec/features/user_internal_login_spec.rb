require 'rails_helper'

RSpec.feature "User logs in" do

  let(:user) { create(:user) }

  context "with valid credentials" do
    scenario "from the root path" do
      visit root_path

      click_link "Login"

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Sign in"

      expect(current_path).to eq(root_path)

      within("nav") do
        expect(page).to have_content("#{user.first_name}")
        expect(page).to_not have_content("Login")
        expect(page).to have_content("Logout")
      end
    end

    scenario "from the product index path" do
      visit packages_path

      click_link "Login"

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Sign in"

      expect(current_path).to eq(packages_path)

      within("nav") do
        expect(page).to have_content("#{user.first_name}")
        expect(page).to_not have_content("Login")
        expect(page).to have_content("Logout")
      end
    end
  end

  context "with invalid credentials" do
    scenario "and is redirected to the login path" do
      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "INVALID-PASSWORD"

      click_button "Sign in"

      expect(current_path).to eq(login_path)

      within ".alert" do
        expect(page).to have_content("Invalid credentials")
      end

      within("nav") do
        expect(page).to_not have_content("#{user.first_name}")
        expect(page).to have_content("Login")
        expect(page).to_not have_content("Logout")
      end
    end
  end
end
