require 'rails_helper'

RSpec.feature "visitor can view packages" do
  scenario "visitor can see package index" do
    package = create(:package_with_items)

    visit packages_path

    within "#packages" do
      expect(page).to have_content(package.name)
      expect(page).to have_content(package.item_names)
    end
  end

  scenario "visitor can see package show page" do
    package = create(:package_with_items)

    visit packages_path

    click_on package.name

    expect(current_path).to eq(package_path(package))

    within "#package" do
      expect(page).to have_content(package.item_names)
      expect(page).to have_content(package.price)
    end
  end
end
