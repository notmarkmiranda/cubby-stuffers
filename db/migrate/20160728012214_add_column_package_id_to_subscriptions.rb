class AddColumnPackageIdToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_reference :subscriptions, :package, foreign_key: true
  end
end
