require "rails_helper"

RSpec.describe RedemptionOfferMailer, type: :mailer do
  it "sends email to user upon sign up" do
    user = User.create(first_name: 'Mr. Test', email: 'test@example.com')
    RedemptionOfferMailer.offer(user).deliver_now
    result = ActionMailer::Base.deliveries.last

    expect(result.To.value).to include "test@example.com"
    expect(result.subject).to include "Welcome to Cubby Stuffers! Special Offer Inside!"
  end
end
