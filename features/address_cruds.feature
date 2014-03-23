@address_cruds

Feature: Address cruds

@address_cruds-1
Scenario: Address read as admin
  Given I am signed in as a admin
  And a customer is populated
  And an address is populated
  Then I visit "/users"
  And I visit the customer show page
  Then I should see the text "Billing Addresses: (1)"
  And I see the address listed
  And I should not see the selector "a#add-address"
  And I should not see the text "Update"
  And I should not see the text "Delete"

@address_cruds-2
Scenario: Address read as customer
  And 2 addresses are populated
  Given I am signed in as a customer
  And I visit the customer show page
  Then I should see the text "Billing Addresses: (2)"
  And I see the address listed
  And I should see the selector "a#add-address"
  And I should see the text "Update"
  And I should see the text "Delete"

@address_cruds-3
Scenario: Address update as customer
  And an address is populated
  Given I am signed in as a customer
  And I visit the address edit page
  Then I should see the text "Update billing address"
  And I submit an address update
  Then I should see the text "Address updated"

@address_cruds-4
Scenario: Address delete as customer
  And 2 addresses are populated
  Given I am signed in as a customer
  And I visit the customer show page
  And I click "Remove"
  And I should see the text "Address deleted"

@address_cruds-5
Scenario: Address cannot delete last as customer
  And an address is populated
  Given I am signed in as a customer
  And I visit the customer show page
  And I see the address listed
  And I should not see the text "Remove"

@address_cruds-6
Scenario: Address add as customer
  And an address is populated
  Given I am signed in as a customer
  And I visit the customer show page
  And I click "Add"
  Then I should see the text "Another billing address"
  Then I submit a new address
  Then I should see the text "Address created"

