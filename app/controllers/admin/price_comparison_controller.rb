class Admin::PriceComparisonController < Admin::BaseController
  def index
    @walmart_products = WalmartProductSearch.get_all(params[:query])

    upcs = @walmart_products.map(&:upc).join(",")
  end
end
