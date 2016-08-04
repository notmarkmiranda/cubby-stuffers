class CreateRedemptions < ActiveRecord::Migration[5.0]
  def change
    create_table :redemptions do |t|
      t.references :user, foreign_key: true
    end
  end
end
