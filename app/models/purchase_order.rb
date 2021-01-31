class PurchaseOrder < ApplicationRecord
  belongs_to :supplier
  # belongs_to :user
  has_one :invoice
  has_one :review
  has_one_attached :PO_document
end
