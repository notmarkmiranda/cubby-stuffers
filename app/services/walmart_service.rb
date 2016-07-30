class WalmartService

  def initialize
    @_connection = Faraday.new("https://api.walmartlabs.com")
  end

  def get_products(item)
    response = connection.get do |req|
      req.url "/v1/search"
      req.params['apiKey'] = ENV["WALMART_API_KEY"]
      req.params['query'] = item
      req.params['sort'] = "price"
      req.params['order'] = "asc"
    end
    parsed = parse(response)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def connection
      @_connection
    end
end
