@purchases

Feature: Purchases

@purchases-1
Scenario: Purchase as customer
  Given I am signed in as a customer
  Then 1 stocks of the book are populated
  And I open the book
  And I should see the text "Add to cart"
  And I click "Add to cart"
  Then I see the cart show page
  And I see the carted book
  Then I click "Checkout"
  And I see the book checkout page
  And a purchase of the book is populated
  And I visit the customer purchase history
  And I see the book purchase history item

@purchases-2
Scenario: Cart cruds
  Given I am signed in as a customer
  Then 2 stocks of the book are populated
  And I open the book
  And I click "Add to cart"
  And I should see the text "Added to cart"
  And I open the book
  And I click "Add to cart"
  And I should see the text "Added to cart"
  And I open the book
  And I click "Add to cart"
  And I should see the text "Not enough stock to cart"
  Then I visit the cart show page
  And I see the carted book
  Then I should see the selector "td a.btn.btn-danger"
  And I click "Remove"
  And I should see the text "Removed from cart"
  And I see the carted book
  And I click "Remove"
  And I should see the text "Removed from cart"
  Then I should not see the selector "td a.btn.btn-danger"
  Then I should not see the text "Checkout"
