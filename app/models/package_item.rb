class PackageItem < ApplicationRecord
  belongs_to :package
  belongs_to :item

  validates :quantity, presence: true
  validates :package_id, uniqueness: {scope: :item_id }, presence: true
  validates :item_id, uniqueness: { scope: :package_id }, presence: true
end
