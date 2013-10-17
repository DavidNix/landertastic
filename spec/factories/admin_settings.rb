# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_settings do
    email "testadmin@example.com"
    site_name "My Site Name"
  end
end
