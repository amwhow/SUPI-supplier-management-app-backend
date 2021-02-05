class RemoveUserFromSuppliers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :suppliers, :user, null: false, foreign_key: true
  end
end
