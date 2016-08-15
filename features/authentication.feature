Feature:
  As a user
  In order to know what my options around my current permissions
  I would like to see a visual queue as to my login status

  Scenario:
    Given I am not logged in
    Then I see a registration notice on the screen

  Scenario:
    Given I am logged in
    Then I see my profile info
