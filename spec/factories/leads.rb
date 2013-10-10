# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lead do
    sequence(:email) { |n| "test#{n}@email.com" }
  end
end
