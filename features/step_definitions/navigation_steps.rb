Given(/^I am on the home page$/) do
  visit '/'
end

Given(/^I am on the registration page$/) do
  visit new_user_path
end

Given(/^I am on a poll page$/) do
  @poll = FactoryGirl.create :poll
  visit poll_path @poll
end

Given(/^I am on the poll creation page$/) do
  visit new_poll_path
end
