When(/^I click the registration page$/) do
  click_link 'Register to create your first poll now!'
end

When(/^I fill out the registration form$/) do
  fill_in 'user_email', with: 'test_cucumber@example.com'
  fill_in 'user_first_name', with: 'Cucumber'
  fill_in 'user_last_name', with: 'User'
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'
  click_button 'registration-submit'
end

When(/^I fill out the registration form incorrectly$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I am registered on with Poll Machine$/) do
  url = URI.parse(current_url)
  expect(url.path).to match(/users\/[\d]+/)
end

Then(/^I receive an error notice$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
