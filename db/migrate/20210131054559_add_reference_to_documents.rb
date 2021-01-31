class AddReferenceToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_reference :documents, :supplier, foreign_key: true
  end
end
