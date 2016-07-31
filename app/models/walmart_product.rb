

class WalmartProduct
  attr_reader :name, :walmart_id, :price, :image_path

  def initialize(product_data)
    @name = clean_name(product_data.dig(:name))
    @walmart_id = product_data.dig(:itemId)
    @price = product_data.dig(:salePrice)
    @image_path = product_data.dig(:thumbnailImage)
  end

  def clean_name(name)
    name.gsub(/\P{ASCII}/, '')
  end
end
