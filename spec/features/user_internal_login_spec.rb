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
      visit products_path

      click_link "Login"

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Sign in"

      expect(current_path).to eq(products_path)

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

      within "#flash_error" do
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

#   scenario "user can logout" do
#     visit root_path
# 
#     click_link "Sign Up"
# 
#     fill_in "Username", with: user.username
#     fill_in "Email", with: user.email
#     fill_in "Password", with: user.password
# 
#     click_button "Create Account"
# 
#     expect(current_path).to eq("/dashboard")
# 
#     within("nav") do
#       expect(page).to have_content("Logged in as #{user.username}")
#       expect(page).to_not have_content("Login")
#       expect(page).to have_content("Logout")
#     end
# 
#     click_link "Logout"
# 
#     expect(current_path).to eq("/login")
#   end
# 
#   scenario "existing user can login" do
#     login_user
# 
#     expect(current_path).to eq("/dashboard")
#     expect(page).to have_content("Logged in as user")
#   end
# 
#   def login_user
#     user = User.create(username: "user",
#                        email: "email@example.com",
#                        password: "password")
# 
#     expect(user).to be_valid
# 
#     visit login_path
#     fill_in "Username", with: user.username
#     fill_in "Password", with: user.password
#     click_button "Login"
#   end
# end
