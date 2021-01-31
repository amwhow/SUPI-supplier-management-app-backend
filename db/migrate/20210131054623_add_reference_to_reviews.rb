class AddReferenceToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :purchase_order, foreign_key: true
  end
end
