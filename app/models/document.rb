class Document < ApplicationRecord
  belongs_to :supplier
  has_one_attached :supplier_document
end
