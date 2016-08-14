When(/^I click the registration page$/) do
  click_link 'Register to create your first poll now!'
end

When(/^I fill out the registration form$/) do
  user = FactoryGirl.build :user
  fill_in 'user_email', with: user.email
  fill_in 'user_first_name', with: user.first_name
  fill_in 'user_last_name', with: user.last_name
  fill_in 'user_password', with: user.password
  fill_in 'user_password_confirmation', with: user.password_confirmation
  click_button 'registration-submit'
end

When(/^I fill out the registration form incorrectly$/) do
  user = FactoryGirl.build :user
  fill_in 'user_email', with: user.email
  fill_in 'user_first_name', with: user.first_name
  fill_in 'user_last_name', with: user.last_name
  fill_in 'user_password', with: user.password
  fill_in 'user_password_confirmation', with: user.password.upcase
  click_button 'registration-submit'
end

Then(/^I am registered on with Poll Machine$/) do
  url = URI.parse(current_url)
  expect(url.path).to match(%r{users\/[\d]+})
end

Then(/^I receive an error notice$/) do
  url = URI.parse(current_url)
  expect(url.path).to match(new_user_path)
  expect(page).to have_css ('.callout.alert')
end
