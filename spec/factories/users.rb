# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Jane'
    last_name 'Doe'
    sequence(:email) { |n| "user#{n}@email.com" }
    password 'qwertyqwerty'
    password_confirmation { |u| u.password }
  end
end
