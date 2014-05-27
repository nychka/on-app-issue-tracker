# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :response do
    body "MyString"
    sender 1
  end
end
