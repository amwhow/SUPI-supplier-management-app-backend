class CreatePurchaseOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_orders do |t|
      t.date :orderDate
      t.boolean :approvalStatus
      t.decimal :totalPrice
      t.boolean :delivered
      # t.references :invoice, foreign_key: true
      # t.references :review, foreign_key: true
      t.timestamps
    end
  end
end
