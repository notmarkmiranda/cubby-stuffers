class CreateCubbies < ActiveRecord::Migration[5.0]
  def change
    create_table :cubbies do |t|
      t.references :user, foreign_key: true
      t.string :location
      t.string :column
      t.string :row

      t.timestamps
    end
  end
end
