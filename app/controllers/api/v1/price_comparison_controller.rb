class Api::V1::PriceComparisonController < ApiBaseController

  def index
    walmart_products = WalmartProductSearch.get_all(params[:query])
    if walmart_products

      upcs_array = walmart_products.map(&:upc)
      amazon_products = AmazonProductSearch.get_matching(upcs_array)

      render json: { walmart_products: walmart_products, amazon_products: amazon_products,
                  query: params[:query], upcs_array: upcs_array }
    else
      render json: { errors: "No Results", query: params[:query] }
    end
  end
end
