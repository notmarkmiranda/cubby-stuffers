class Admin::PriceComparisonController < Admin::BaseController
  def index
    @walmart_products = WalmartProductSearch.get_all(params[:query])

    upcs_array = @walmart_products.map(&:upc)

    @amazon_products = AmazonProductSearch.get_matching(upcs_array)
  end
end
