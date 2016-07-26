require 'rails_helper'

RSpec.describe Product, type: :model do
  it "lists associated item names" do
    product = create(:product)
    item1 = create(:item, name: "Peanut M&M's")
    item2 = create(:item, name: "Wheat Thins")
    product.items << [item1, item2]

    expect(product.item_names).to eq("Peanut M&M's, Wheat Thins")
  end
end
