require "rails_helper"

RSpec.feature "Registered User Makes a Purchase" do
  context "they enter valid subscription details" do
    scenario "they are redirected to an order summary page", js: true do
      user = create(:user)
      package = create(:product_with_items)
      login_user(user)

      visit "/packages"
      click_on package.name
      find(:select, from, options).find("1703", from, options).select_option

      expect(page).to have_content "Weeks: 6"

      click_on "SUBSCRIBE"

      sleep(2)
      stripe_iframe = all('iframe[name=stripe_checkout_app]')
    end
  end
end
