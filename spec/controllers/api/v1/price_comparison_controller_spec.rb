require "rails_helper"

RSpec.describe Api::V1::PriceComparisonController do
  describe "GET index" do
    it "can get all item prices for walmart and amazon for a given item name" do
      query = "oreos"
      get :index, query: query

      expect(response.status).to eq 200

      items = JSON.parse(response.body)

      expect(items.keys).to include "walmart_products"
      expect(items.keys).to include "amazon_products"
      expect(items.keys).to include "query"
      expect(items.keys).to include "upcs_array"
    end
  end
end
