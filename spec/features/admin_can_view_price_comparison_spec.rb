require 'rails_helper'

RSpec.feature "admin can see price comparison" do
  scenario "admin enters an item name query and it returns the item id" do

    visit "/admin/dashboard"

    click_on "Price Comparison Tool"

    expect(page).to have_content("Enter an item name:")

    fill_in "Item", with: "blue diamond almonds"

    click_on "Search"

    within ".items_table" do
      expect(page).to have_content("45595112")
    end
  end
end
