require "rails_helper"

describe AmazonService do
  context "#item prices" do
    it "returns item price for the given item upc" do
      item_name = "blue diamond almonds"
      upc = "041570109489"

      all_data = AmazonService.new.get_info(upc)

      item = all_data.first
      url = "http://www.amazon.com/Blue-Diamond-Almonds-Salted-Caramel/dp/B00DY8DBX8%3FSubscriptionId%3DAKIAJ3BXPLLMU6Z2S4QA%26tag%3Dcubbystuffers-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00DY8DBX8"

      expect(item["DetailPageURL"]).to eq(url)
      expect(item["ItemAttributes"]["UPC"]).to eq(upc)
      expect(item["ItemAttributes"]["Feature"][1]).to eq("Irresistible snacking")
      expect(item["OfferSummary"]["LowestNewPrice"]["FormattedPrice"]).to eq("$3.40")
      expect(item["EditorialReviews"]["EditorialReview"]["Content"]).to eq("This is one of those snacks we predict will disappear quickly.  So go ahead and enjoy the crunch of these oven roasted almonds.  The flavor packed combination is also a good source of protein to help you get up and go.")
    end

    it "returns item price for the given item upc" do
      upcs = "041570109489,041570072561,041570050392,041570053386,041570059821"
      all_data = AmazonService.new.get_info(upcs)

      item1, item2 = all_data[0], all_data[4]
      expect(item1["ItemAttributes"]["UPC"]).to eq("041570109489")
      expect(item2["ItemAttributes"]["UPC"]).to eq("041570072561")
    end
  end
end
