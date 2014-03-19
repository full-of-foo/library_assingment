@sign_in

Feature: Sign In

@sign_in-1
Scenario: Unsuccessful signin
  Given I visit "/signin"
  And I submit an unknown user login
  Then I should see an error message

@sign_in-2
Scenario: Signin known customer
  Given I visit "/signin"
  And I submit a known customer login
  Then I see the customer profile page
  Then I sign out
  And I see the sessionless home page
  Then I visit the customer edit page
  And I should see the text " Please sign in "
  Then I submit the customer login
  And I see the customer edit profile page

@sign_in-3
Scenario: Signin known admin
  Given I visit "/signin"
  And I submit a known admin login
  Then I see the admin profile page
  Then I sign out
  And I see the sessionless home page
  Then I visit the admin edit page
  And I should see the text " Please sign in "
  Then I submit the admin login
  And I see the admin edit profile page
