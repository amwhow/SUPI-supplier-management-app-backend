class Invoice < ApplicationRecord
  belongs_to :purchase_order
  has_one_attached :invoice_document
end
