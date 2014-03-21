@user_cruds

Feature: User cruds

@user_cruds-1
Scenario: Unsuccessful customer update
  Given I am signed in as a customer
  Given I visit the customer edit page
  Then I submit an invalid customer update
  And I should see an error message

@user_cruds-2
Scenario: Customer update
  Given I am signed in as a customer
  Given I visit the customer edit page
  And I submit a customer update
  And I should see the text "Profile updated"

@user_cruds-3
Scenario: Admin update
  Given I am signed in as a admin
  Given I visit the admin edit page
  And I submit an admin update
  And I should see the text "Profile updated"

@user_cruds-4
Scenario: Users index as admin
  Given I am signed in as a admin
  And the customers and admins are populated
  Then I visit "/users"
  And I see the users page

@allow-rescue
@user_cruds-5
Scenario: Users index as customer
  Given I am signed in as a customer
  Then I visit "/users" and get a 404

@user_cruds-6
Scenario: Admin delete customer
  Given I am signed in as a admin
  And the customers and admins are populated
  Then I visit "/users"
  And I delete the first customer
  And I should see the text "Account deleted"

@user_cruds-7
Scenario: Customer cannot delete customer
  Given I am signed in as a customer
  And the customers and admins are populated
  Then I visit "/users"
  And I should not see the text "delete"

@user_cruds-8
Scenario: Admin delete self
  Given I am signed in as a admin
  Then I visit the admin show page
  And I click "Delete Account"
  And I should see the text "Account deleted"
  And I should see the text "Follow me and enter!"


