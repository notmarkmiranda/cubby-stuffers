class RenameProductItemstoPackageItems < ActiveRecord::Migration[5.0]
  def change
    rename_table :product_items, :package_items
  end
end
