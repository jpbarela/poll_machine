Given(/^I am logged in$/) do
  @user = FactoryGirl.create :user
  visit '/'
  click_link 'Login'
  fill_in 'user_email', with: @user.email
  fill_in 'user_password', with: @user.password
  click_button 'login-submit'
end

Given(/^I am not logged in$/) do
  visit '/'
  click_link 'Logout' if page.has_content? 'Logout'
end

Then(/^I see a registration notice on the screen$/) do
  expect(page).to have_content 'Sign Up!'
  expect(page).to have_content 'Login'
end

Then(/^I see my profile info$/) do
  visit '/'
  expect(page).to have_content @user.first_name
  expect(page).to have_content 'Logout'
end