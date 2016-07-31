require "rails_helper"

describe AmazonService do
  context "#item prices" do
    it "returns item prices for the given item upc" do
      VCR.use_cassette("amazon_item_prices") do
        item_name = "blue diamond almonds"
        upc = "041570109489"

        data = AmazonService.new.get_info(upc)

        expect(data).to include item_name
      end
    end
  end
end
