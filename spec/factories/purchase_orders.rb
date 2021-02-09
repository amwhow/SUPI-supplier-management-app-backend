FactoryBot.define do
  factory :purchase_order do
    orderDate { '2021-01-31' }
    approvalStatus { false }
    totalPrice { '9.99' }
    delivered { false }
  end
end
