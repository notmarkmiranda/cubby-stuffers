require "rails_helper"

RSpec.feature "admin login functions" do
  scenario "admin logs in" do
    admin = create(:user, role: 1)

    visit login_path

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password

    click_button "Sign in"

    expect(current_path).to eq(admin_dashboard_path)
  end
end
