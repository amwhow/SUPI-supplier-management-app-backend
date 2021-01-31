class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :service
      t.string :website
      t.string :contact_name
      t.string :contact_email
      t.string :contact_number
      t.text :description
      t.text :note

      # t.references :purchase_order, foreign_key: true
      # t.references :document, foreign_key: true
      # t.references :user_supplier, foreign_key: true
      
      t.timestamps
    end
  end
end
