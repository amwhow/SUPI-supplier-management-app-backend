FactoryBot.define do
  factory :user do
    user_name { 'MyString' }
    email { 'MyString' }
    password_digest { 'MyString' }
    company_name { 'MyString' }
  end
end
