class CreateUserSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_suppliers do |t|
      # t.belongs_to :user
      t.belongs_to :supplier
      t.timestamps
    end
  end
end
