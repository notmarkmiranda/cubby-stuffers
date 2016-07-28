require 'rails_helper'

RSpec.describe PackageItem, type: :model do
  context "validations" do
     it { should validate_presence_of(:quantity) }
     it { should validate_presence_of(:package_id) }
     it { should validate_uniqueness_of(:package_id).scoped_to(:item_id) }
     it { should validate_presence_of(:item_id) }
     it { should validate_uniqueness_of(:item_id).scoped_to(:package_id) }
  end
end
