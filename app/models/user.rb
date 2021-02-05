class User < ApplicationRecord
  has_many :suppliers
  has_many :purchase_orders
  has_many :documents
  has_many :invoices
  has_one_attached :logo
  has_secure_password
  
  # validates :user_name, presence: true, uniqueness:true
  # validates :email, presence: true, uniqueness:true
  # validates :company_name, presence: true
end
