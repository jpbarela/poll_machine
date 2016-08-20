When(/^I fill out the new poll form$/) do
  fill_in 'poll_name', with: 'Rate my Poll'
  find('input[data-question="1"]').set("How's my poll?")
  find('input[data-choice-1="1"]').set("It's great!")
end

When(/^I add a new question to the poll$/) do
  fill_in 'poll_name', with: 'Rate my Poll'
  find('input[data-question="1"]').set("How's my poll?")
  find('input[data-choice-1="1"]').set("It's great!")
  find('input[data-question="2"]').set("Should I add more questions?")
  find('input[data-choice-2="1"]').set("Yes")
end

When(/^I fill out the poll$/) do
  @poll.questions.each do |question|
    choose "question_#{question.id}_#{question.choices.last.id}"
  end
end

When(/^I add a new choice to a question$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^A new poll should be created$/) do
  expect { click_button('poll-create') }.to change { Poll.count }.by(1)
end

Then(/^The question is added to the poll$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^My answers should be recorded$/) do
  expect { click_button('poll-submit') }.to change { Response.count }.by(1)
  created_response = Response.last
  expect(created_response.choices.size).to be @poll.questions.size
  choice_array = @poll.questions.map { |question| question.choices.last }
  expect(created_response.choices.to_a).to match_array choice_array
end

Then(/^The poll should have (\d+) questions$/) do |questions|
  expect(Poll.last.questions.size).to be questions.to_i
end

Then(/^The question should have (\d+) choices$/) do |choices|
  pending # Write code here that turns the phrase above into concrete actions
end