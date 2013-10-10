# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hit do
    ip_address "0.0.0.0"
    user_agent "Mozilla"
  end
end
