class AddUserToPurchaseOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :purchase_orders, :user, null: false, foreign_key: true
  end
end
