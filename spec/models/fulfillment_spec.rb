require 'rails_helper'

RSpec.describe Fulfillment, type: :model do
  context "validations" do
    it { should validate_presence_of(:subscription_id) }
    it { should validate_uniqueness_of(:week).scoped_to(:subscription_id).case_insensitive }
  end
end
