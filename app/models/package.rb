class Package < ApplicationRecord
  has_many :package_items
  has_many :items, through: :package_items
  has_many :subscriptions

  validates :name, uniqueness: true, presence: true
  validates :price, presence: true

  def item_names
    items.pluck(:name).join(", ")
  end
end
