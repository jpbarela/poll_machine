When(/^I fill out the new poll form$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^A new poll should be created$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I have created a new poll$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I add a new question to the poll$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The question is added to the poll$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I fill out the poll$/) do
  @poll.questions.each do |question|
    choose "question_#{question.id}_#{question.choices.last.id}"
  end
end

Then(/^My answers should be recorded$/) do
  expect { click_button('poll-submit') }.to change { Response.count }.by(1)
  created_response = Response.last
  expect(created_response.choices.size).to be @poll.questions.size
  choice_array = @poll.questions.map { |question| question.choices.last }
  expect(created_response.choices.to_a).to match_array choice_array
end
