class PurchaseOrder < ApplicationRecord
  belongs_to :supplier
  # belongs_to :user
  has_one :invoice, dependent: :destroy
  has_one :review, dependent: :destroy
  has_one_attached :po_document

  validates :orderDate, presence: true
  # validates :approvalStatus, presence: true
  validates :totalPrice, presence: true
  validates :totalPrice, numericality: { greater_than_or_equal_to: 1 }
  # validates :delivered, presence: true
end
