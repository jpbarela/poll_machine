Feature:
  As a user
  In order to find out what others think
  I would like to create a poll

  Scenario:
    Given I am logged in
    And I am on the poll creation page
    When I fill out the new poll form
    Then A new poll should be created

  @javascript
  Scenario:
    Given I am logged in
    And I am on the poll creation page
    When I add a new question to the poll
    Then A new poll should be created
    And The poll should have 2 questions

  @javascript
  Scenario:
    Given I am logged in
    And I am on the poll creation page
    When I add a new choice to a question
    Then A new poll should be created
    And The question should have 2 choices
