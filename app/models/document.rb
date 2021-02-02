class Document < ApplicationRecord
  belongs_to :supplier
  has_one_attached :supplier_document

  validates :expiryDate, presence: true
  validates :documentType, presence: true
end
