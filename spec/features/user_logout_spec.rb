require 'rails_helper'

RSpec.feature "User logs out" do

  let(:user) { create(:user) }

  scenario "from the root path" do
    login_user(user)

    visit root_path

    within("nav") do
      expect(page).to have_content("#{user.first_name}")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end

    click_link "Logout"

    within("#flash_notice") do
      expect(page).to have_content("Logged out successfully!")
    end

    expect(current_path).to eq("/login")
  end
end
