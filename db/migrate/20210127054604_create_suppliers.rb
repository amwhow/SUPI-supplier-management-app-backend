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

      t.timestamps
    end
  end
end
