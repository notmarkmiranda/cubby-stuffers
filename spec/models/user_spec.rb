require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) }
  let(:github_user) { build(:user, uid: "5", oauth_token: "asdlkfj") }
  let(:internal_user) { build(:user, uid: nil, password: nil) }

  it "has a valid factory" do
    expect(user).to be_valid
  end

  context "validations" do
    it { expect(user).to validate_presence_of(:first_name) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email) }
    it { expect(user).to validate_presence_of(:role) }
  end

  context "if logging in with github" do
    it "validates github scpecific" do
      expect(github_user).to validate_presence_of(:oauth_token)
      expect(github_user).to validate_uniqueness_of(:uid)
    end
  end

  context "if logging in with internal account" do
    it "validates internal specific" do
      expect(internal_user).to validate_presence_of(:last_name)
      expect(internal_user).to validate_confirmation_of(:email)
      expect(internal_user).to validate_presence_of(:password)
    end
  end

end
