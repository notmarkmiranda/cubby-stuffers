require 'rails_helper'

RSpec.describe Redemption, type: :model do
  let(:redemption) { build(:redemption) }

  context "responds to the correct attributes" do
    it { expect(redemption).to respond_to(:user) }
  end
  
  context "validations" do
    it { expect(redemption).to validate_presence_of(:user) }
  end

  it "returns all user ids" do
    redemption_list =  create_list(:redemption, 3) 
    user_ids = Redemption.user_ids

    expect(user_ids.length).to eq(3)
  end

  it "returns eligible users" do
    redemption_list =  create_list(:redemption, 3) 
    users = Redemption.eligible_users

    expect(users.length).to eq(3)
  end
end
