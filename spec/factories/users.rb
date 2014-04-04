# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@email.com" }
    first_name 'Jane'
    last_name 'Doe'
    password 'qwertyqwerty'
    password_confirmation 'qwertyqwerty'
  end
end
