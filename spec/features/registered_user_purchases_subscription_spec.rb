require "rails_helper"

RSpec.feature "Registered User Makes a Purchase", js: true do
  context "they enter valid subscription details" do
    scenario "they are redirected to an order summary page" do
      user = create(:user)
      package = create(:package_with_items)
      login_user(user)

      visit "/packages"
      click_on package.name
      #find(:select, from, options).find("1703", from, options).select_option
      select "1703", from: "Select Module" 

      #expect(page).to have_content "Weeks: 6"

      click_on "Pay with Card"

      sleep(2)
      stripe_iframe = all('iframe[name=stripe_checkout_app]').last
      Capybara.within_frame stripe_iframe do
        page.execute_script(%Q{ $('input#email').val('coolguy@yahoo.com'); })
        page.execute_script(%Q{ $('input#card_number').val('4242424242424242'); })
        page.execute_script(%Q{ $('input#cc-exp').val('08/44'); })
        page.execute_script(%Q{ $('input#cc-csc').val('123'); })
        page.execute_script(%Q{ $('#submitButton').click(); })
       sleep(10)
      end

      subscription = Subscription.find(1)

      expect(current_path).to eq subscription_path(subscription)
      expect(page).to have_content package.name
      expect(page).to have_content package.items.map(&:name).join(", ")
      expect(page).to have_content subscription.weeks
      expect(page).to have_content subscription.price
      expect(page).to have_content subscription.module
    end
  end
end
