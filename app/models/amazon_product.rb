class AmazonProduct
  attr_reader :name, :price, :upc, :prime, :url

  def initialize(product_data)
    @name = product_data.dig("ItemAttributes", "Title")
    @price = product_data.dig("OfferSummary", "LowestNewPrice", "FormattedPrice")
    @upc = product_data.dig("ItemAttributes", "UPC")
    @prime = product_data.dig("Offers", "Offer", "OfferListing", "IsEligibleForPrime")
    @url = product_data.dig("DetailPageURL")
  end

  def is_prime?
    @prime == "1"
  end

end
