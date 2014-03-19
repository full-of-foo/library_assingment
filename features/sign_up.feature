@sign_up

Feature: Sign Up

@sign_up-1
Scenario: Unsuccessful signup
  Given I visit "/"
  And I click "Sign Up"
  Then I submit an invalid signup
  And I should see an error message

@sign_up-2
Scenario: Customer signup
  Given I visit "/signup"
  Then I submit the customer signup
  And I see the customer profile page
  And I should see the text " Welcome to the Crappy-Book-Store.com! "

