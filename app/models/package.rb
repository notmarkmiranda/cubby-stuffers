class Package < ApplicationRecord
  has_many :package_items
  has_many :items, through: :package_items

  def item_names
    items.pluck(:name).join(", ")
  end
end
