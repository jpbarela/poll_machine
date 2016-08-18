FactoryGirl.define do
  factory :poll do
    user
    name 'Test Poll'

    after(:create) do |poll|
      create_list(:question, 3, poll: poll)
    end
  end
end
