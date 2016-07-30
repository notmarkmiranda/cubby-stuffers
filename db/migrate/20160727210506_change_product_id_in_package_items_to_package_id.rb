class ChangeProductIdInPackageItemsToPackageId < ActiveRecord::Migration[5.0]
  def change
    rename_column :package_items, :product_id, :package_id
  end
end
