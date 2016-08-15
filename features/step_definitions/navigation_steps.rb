Given(/^I am on the home page$/) do
  visit '/'
end

Given(/^I am on the registration page$/) do
  visit new_user_path
end
