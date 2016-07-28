require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:role) }
  end

  context "if logging in with github" do
    it "validates github scpecific" do
      user = build(:user, uid: "5", oauth_token: "asdlkfj")
      expect(user).to validate_presence_of(:oauth_token)
      expect(user).to validate_uniqueness_of(:uid)
    end
  end

  context "if logging in with internal account" do
    it "validates internal specific" do
      user = build(:user, uid: nil, password: nil)
      expect(user).to validate_presence_of(:last_name)
      expect(user).to validate_confirmation_of(:email)
      expect(user).to validate_presence_of(:password)
    end
  end

end
