class Supplier < ApplicationRecord
  has_many :documents
  has_many :purchase_orders
  has_many :user_suppliers
  has_one_attached :logo
  # has_many_attached :documents
  has_many :users, through: :user_supplier
end
