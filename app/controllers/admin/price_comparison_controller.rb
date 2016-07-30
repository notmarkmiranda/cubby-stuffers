class Admin::PriceComparisonController < Admin::BaseController
  def index
    @walmart_products = WalmartProductSearch.get_all(params[:query])
  end
end
