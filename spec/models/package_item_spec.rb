require 'rails_helper'

RSpec.describe PackageItem, type: :model do
  let(:package_item) { build(:package_item) }

  context "responds to the correct attributes" do
    it { expect(package_item).to respond_to(:package) }
    it { expect(package_item).to respond_to(:item) }
  end

  context "validations" do
     it { expect(package_item).to validate_presence_of(:quantity) }
     it { expect(package_item).to validate_presence_of(:package_id) }
     it { expect(package_item).to validate_uniqueness_of(:package_id).scoped_to(:item_id) }
     it { expect(package_item).to validate_presence_of(:item_id) }
     it { expect(package_item).to validate_uniqueness_of(:item_id).scoped_to(:package_id) }
  end
end
