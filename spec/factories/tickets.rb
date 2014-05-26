# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    sender_name "MyString"
    sender_email "MyString"
    subject "MyString"
    body "MyText"
    code "MyString"
    department_id 1
    owner_id 1
    status_id 1
  end
end
