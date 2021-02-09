FactoryBot.define do
  factory :invoice do
    receivedDate { '2021-01-31' }
    dueDate { '2021-01-31' }
    totalPrice { '9.99' }
    paid { false }
  end
end
