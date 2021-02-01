class User < ApplicationRecord
  has_many :user_suppliers
  has_many :suppliers,
    through: :user_supplier
  has_one_attached :logo
  has_secure_password
  validates :user_name, presence: true, uniqueness:true
  validates :email, presence: true, uniqueness:true
  validates :company_name, presence: true
end
