class PackageItem < ApplicationRecord
  belongs_to :package
  belongs_to :item
end
