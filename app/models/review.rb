class Review < ApplicationRecord
  belongs_to :purchase_order

  validates :qualityRating, presence: true
  validates :qualityRating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  validates :reliabilityRating, presence: true
  validates :reliabilityRating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  validates :costRating, presence: true
  validates :costRating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  validates :comment, length: { maximum: 800 }
end
