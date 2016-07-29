class CreateFulfillments < ActiveRecord::Migration[5.0]
  def change
    create_table :fulfillments do |t|
      t.string :week
      t.boolean :fulfilled?
      t.references :subscription, foreign_key: true

      t.timestamps
    end
  end
end
