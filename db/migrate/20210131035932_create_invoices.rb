class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.date :receivedDate
      t.date :dueDate
      t.decimal :totalPrice
      t.boolean :paid

      t.timestamps
    end
  end
end
