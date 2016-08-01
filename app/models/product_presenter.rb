class ProductPresenter
  attr_reader :template

  def initialize(walmart_product, amazon_products, template)
    @walmart_product = walmart_product
    @amazon_products = amazon_products
    @template = template
  end

  def matching_amazon_product
    @amazon_products.find do |amazon_product|
      amazon_product.upc == @walmart_product.upc
    end
  end

  def matching_amazon_price
    if matching_amazon_product
      template.link_to(matching_amazon_product.price, matching_amazon_product.url)
    else
      "Not available"
    end
  end
end
