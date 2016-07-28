class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true
      t.integer :price
      t.string :module
      t.integer :weeks

      t.timestamps
    end
  end
end
