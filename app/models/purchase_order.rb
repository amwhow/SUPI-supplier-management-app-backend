class PurchaseOrder < ApplicationRecord
  belongs_to :supplier
  # belongs_to :user
  has_one :invoice
  has_one :review
  has_one_attached :PO_document

  validates :orderDate, presense: true
  validates :approvalStatus, presence: true
  validates :totalPrice, presence: true
  validates :totalPrice, numericality: { greater_than_or_equal_to: 1 }
  validates :delivered, presence: true
  
end
