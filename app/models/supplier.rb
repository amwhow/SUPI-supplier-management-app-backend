class Supplier < ApplicationRecord
  has_many :documents, dependent: :destroy
  has_many :purchase_orders, dependent: :destroy
  belongs_to :user
  has_one_attached :logo
  
end
