class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      # :limit => 1 means (1 byte, -128 to 127)
      t.integer :qualityRating, limit: 1
      t.integer :reliabilityRating, limit: 1
      t.integer :costRating, limit: 1
      t.text :comment

      t.timestamps
    end
  end
end
