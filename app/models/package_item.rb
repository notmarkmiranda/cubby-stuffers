class PackageItem < ApplicationRecord
  belongs_to :package
  belongs_to :item

  validates :quantity, uniqueness: { scope: [:package_id, :item_id] }
end
