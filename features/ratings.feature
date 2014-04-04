@ratings

Feature: Ratings

@ratings-1
Scenario: Ratings as admin
  Given I am signed in as a admin
  Then the customer book rating is populated
  And I open the book
  And I should see the average rating
  And I should not see the text "Your Rating:"


@ratings-2
Scenario: Ratings as customer
  Given I am signed in as a customer
  Then the customer book rating is populated
  And I open the book
  And I should see the average rating
  And I should see the text "Your Rating:"
  And I should see the customer rating
