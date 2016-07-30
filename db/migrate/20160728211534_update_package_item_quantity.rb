class UpdatePackageItemQuantity < ActiveRecord::Migration[5.0]
  def change
    change_column_default :package_items, :quantity, 1
  end
end
