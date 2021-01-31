class AddReferenceToPurchaseOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :purchase_orders, :supplier, null: false, foreign_key: true
  end
end
