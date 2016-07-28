class RenameProductstoPackages < ActiveRecord::Migration[5.0]
  def change
    rename_table :products, :packages
  end
end
