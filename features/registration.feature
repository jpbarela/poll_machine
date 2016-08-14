Feature:
  As a user
  In order to manage polls
  I would like to create an account

  Scenario:
    Given I am on the home page
    When I click the registration page
    And I fill out the registration form
    Then I am registered on with Poll Machine

  Scenario:
    Given I am on the registration page
    When I fill out the registration form incorrectly
    Then I receive an error notice