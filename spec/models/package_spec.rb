require 'rails_helper'

RSpec.describe Package, type: :model do
  it "lists associated item names" do
    package = create(:package)
    item1 = create(:item, name: "Peanut M&M's")
    item2 = create(:item, name: "Wheat Thins")
    package.items << [item1, item2]

    expect(package.item_names).to include "Peanut M&M's"
    expect(package.item_names).to include "Wheat Thins"
  end

  context "validations" do
     it { should validate_presence_of(:name) }
     it { should validate_uniqueness_of(:name) }
     it { should validate_presence_of(:price) }
  end
end
