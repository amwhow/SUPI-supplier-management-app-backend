class RemoveSupplierFromUserSuppliers < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_suppliers, :supplier_id, :bigint
  end
end
