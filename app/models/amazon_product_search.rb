class AmazonProductSearch

  def initialize(upcs)
    @_upcs = upcs
  end

  def self.get_matching(upcs)
    new(upcs).get_matching
  end

  def get_matching
    unique_product_data.map do |product_data|
      AmazonProduct.new(product_data) 
    end
  end

  def unique_product_data
    result = upcs.map do |upc|
      all_product_data.find do |product_data|
        product_data.dig("ItemAttributes","UPC") == upc unless product_data.nil?
      end
    end

    return result.compact
  end

  def upcs_list_to_string
    upcs.join(",")
  end

  private

  def all_product_data
    @_all_product_data ||= service.get_info(upcs_list_to_string)
  end

  def service
    @_service ||= AmazonService.new
  end

  def upcs
    @_upcs
  end
end
