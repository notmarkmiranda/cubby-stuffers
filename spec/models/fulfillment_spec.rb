require 'rails_helper'

RSpec.describe Fulfillment, type: :model do
  let(:fulfillment) { build(:fulfillment) }

  context "validations" do
    it { expect(fulfillment).to validate_presence_of(:subscription) }
  end

  it "scoped validation" do
    expect(fulfillment).to validate_uniqueness_of(:week).scoped_to(:subscription_id).case_insensitive
  end
end
