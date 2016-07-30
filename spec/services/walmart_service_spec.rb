require "rails_helper"

describe WalmartService do
  context "#itemid" do
    it "returns item ids for the given item name" do
      VCR.use_cassette("item_ids") do
        item = "blue diamond almonds"
        item_ids = WalmartService.new.get_item_ids(item)
        expect(item_ids[:items].first[:itemId]).to eq 45595112
      end
    end
  end
end
