class Supplier < ApplicationRecord
  has_many :documents, dependent: :destroy
  has_many :purchase_orders, dependent: :destroy
  belongs_to :user
  has_one_attached :logo
  # has_many_attached :documents

  # validates :name, presence: true
  # validates :name, length: { in: 2..25 }
  # validates :service, presence: true
  # validates :contact_name, length: { in: 2..30 }
  # validates :contact_email, presence: true
  # validates :description, length: { maximum: 500 }
  # validates :note, length: { maximum: 500 }
end
