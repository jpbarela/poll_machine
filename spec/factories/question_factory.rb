FactoryGirl.define do
  factory :question do
    poll
    text "What's a test question?"

    after(:create) do |question|
      create_list(:choice, 3, question: question)
    end
  end
end