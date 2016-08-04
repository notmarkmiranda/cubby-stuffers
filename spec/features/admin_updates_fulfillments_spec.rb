require "rails_helper"

RSpec.feature "admin updates fulfillments spec" do
  context "valid logged in admin updates fulfillments" do
    scenario "the fulfillment is removed from the pending list" do
      admin = create(:user, role: "admin")
      create(:user_with_subscriptions)
      subscription = Subscription.first
      fulfillment = create(:fulfillment, subscription: subscription)

      login_user(admin)

      visit admin_fulfillments_path

      expect(page).to have_content "Pending Fulfillments"
      within "#sub-id-#{subscription.id}-week-#{fulfillment.week}" do
        click_on "Pending"
      end

      updated_fulfillment = Fulfillment.find(fulfillment.id)

      expect(updated_fulfillment.fulfilled?).to eq true

      within "#sub-id-#{subscription.id}-week-#{fulfillment.week}" do
        expect(page).to_not have_link("Pending")
      end
    end
  end
end
