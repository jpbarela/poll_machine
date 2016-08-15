FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    first_name 'Test'
    last_name 'User'
    email
    password 'password'
    password_confirmation 'password'
  end
end
