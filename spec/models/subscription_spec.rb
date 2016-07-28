require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context "validations" do
     it { should validate_presence_of(:user_id) }
     it { should validate_presence_of(:package_id) }
     it { should validate_presence_of(:price) }
     it { should validate_presence_of(:module) }
     it { should validate_presence_of(:weeks) }
  end
end
