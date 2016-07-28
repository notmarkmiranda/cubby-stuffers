require 'rails_helper'

RSpec.describe PackageItem, type: :model do
  context "validations" do
     it { should validate_uniqueness_of(:quantity).scoped_to(:package_id, :item_id) }
  end
end
