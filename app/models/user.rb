class User < ApplicationRecord
  has_many :suppliers, dependent: :destroy
  has_many :purchase_orders, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_one_attached :logo
  has_secure_password
  
  # validates :user_name, presence: true, uniqueness:true
  # validates :email, presence: true, uniqueness:true
  # validates :company_name, presence: true
end
