class RenameColumnModuleInSubscriptionsToMod < ActiveRecord::Migration[5.0]
  def change
    rename_column :subscriptions, :module, :mod
  end
end
