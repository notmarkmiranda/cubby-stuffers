require "rails_helper"

RSpec.feature "admin views fulfillments spec" do
  context "valid logged in admin visits fulfillments" do
    scenario "they see all pending fulfillments" do
      admin = create(:user, role: "admin")
      create(:user_with_subscriptions)

      login_user(admin)

      visit admin_dashboard_path

      click_on "Pending Fulfillments"
      
      expect(current_path).to eq admin_fulfillments_path
      expect(page).to have_content "Pending Fulfillments"

      within "#pending-fulfillments" do
        expect(page).to have_content "First Name"
        expect(page).to have_content "Last Name"
        expect(page).to have_content "Module"
        expect(page).to have_content "Week"
        expect(page).to have_link "Pending"
      end
    end
  end
end
