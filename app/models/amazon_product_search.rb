class AmazonProductSearch
  attr_reader :upcs

  def initialize(upcs)
    @upcs = upcs
  end

  def self.get_matching(upcs)
    new(upcs).get_matching
  end

  def get_matching
    all_product_data.dig(:items).map do |product_data|
      AmazonProduct.new(product_data)
    end
  end

  def all_product_data
    service.get_info(upcs)
  end

  def service
    @service ||= AmazonService.new
  end


end
