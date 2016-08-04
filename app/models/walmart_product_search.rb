class WalmartProductSearch
  attr_reader :query

  def initialize(query)
    @query = query
  end

  def self.get_all(query)
    new(query).get_all
  end

  def get_all
    if all_product_data.dig(:items).nil?
      return nil
    else
      all_product_data.dig(:items).map do |product_data|
        WalmartProduct.new(product_data)
      end
    end
  end

  def all_product_data
    service.get_products(query)
  end

  def service
    @service ||= WalmartService.new
  end
end
