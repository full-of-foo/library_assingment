@permissions

Feature: Permissions

@allow-rescue
@permissions-1
Scenario: User routes
  Given I am signed in as a customer
  Then I visit "/users"
  And I should see the text "Not authorized"
  Then a customer is populated
  Then I visit the customer edit page
  And I should see the text "Not authorized"
  Then I visit the customer show page
  And I should see the text "Not authorized"
  Then an admin is populated
  And I visit the admin edit page
  And I should see the text "Not authorized"
  And I visit the admin show page
  And I should see the text "Not authorized"
  Given I am signed in as a admin
  Then an admin is populated
  And I visit the admin edit page
  And I should see the text "Not authorized"
  Then I visit the customer edit page
  And I should see the text "Not authorized"

@allow-rescue
@permissions-2
Scenario: Address routes
  Given I am signed in as a customer
  And a customer is populated
  And an address is populated
  And I visit the address edit page
  And I should see the text "Not authorized"
  Given I am signed in as a admin
  And I visit the address edit page
  And I should see the text "Not authorized"

@allow-rescue
@permissions-3
Scenario: Purchase routes
  Given I am signed in as a customer
  And a customer is populated
  And I visit the customer purchase history
  And I should see the text "Not authorized"
