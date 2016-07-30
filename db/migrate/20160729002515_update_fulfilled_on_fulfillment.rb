class UpdateFulfilledOnFulfillment < ActiveRecord::Migration[5.0]
  def change
    change_column_default :fulfillments, :fulfilled?, false
  end
end
