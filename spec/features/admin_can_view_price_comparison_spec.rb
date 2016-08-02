require 'rails_helper'

RSpec.feature "admin can see price comparison" do
  scenario "admin enters an item name query and it returns the item id" do
    admin = create(:user, role: 'admin')
    login_user(admin)
    visit "/admin/dashboard"

    fill_in "Enter Item Name:", with: "blue diamond almonds"

    click_on "Search"

    expect(current_path).to eq admin_price_comparison_path

    within ".price_comparison_table" do
      expect(page).to have_content("041570109489")
    end
  end
end
