class Invoice < ApplicationRecord
  belongs_to :purchase_order
  has_one_attached :invoice_document

  validates :receivedDate, presence: true
  validates :dueDate, presence: true
  validates :totalPrice, presence: true
  validates :totalPrice, numericality: { greater_than_or_equal_to: 1 }
  # validates :paid, presence: true
end
