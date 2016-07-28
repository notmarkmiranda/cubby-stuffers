class Package < ApplicationRecord
  has_many :package_items
  has_many :items, through: :package_items
  has_many :subscriptions

  def item_names
    items.pluck(:name).join(", ")
  end
end
