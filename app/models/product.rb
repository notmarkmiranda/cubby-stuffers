class Product < ApplicationRecord
  has_many :product_items
  has_many :items, through: :product_items

  def item_names
    items.pluck(:name).join(", ")
  end
end
