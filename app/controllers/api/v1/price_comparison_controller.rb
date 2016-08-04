class Api::V1::PriceComparisonController < ApiBaseController

  def index
    # binding.pry
    walmart_products = WalmartProductSearch.get_all(params[:query])
    query = params[:query]
    upcs_array = walmart_products.map(&:upc)
    amazon_products = AmazonProductSearch.get_matching(upcs_array)

    render json: { walmart_products: walmart_products, amazon_products: amazon_products,
                  query: query, upcs_array: upcs_array }
  end
end
