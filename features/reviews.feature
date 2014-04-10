@reviews

Feature: reviews

@reviews-1
Scenario: Create and update review as customer
  Given I am signed in as a customer
  And 3 reivews for the book are populated
  And I open the book
  Then I see the book show page
  And I should see the text "Make Review"
  And I should not see the text "Update Review"
  And I click "Make Review"
  And I submit a review
  And I should see the text "Review added!"
  Then I should see the submitted review
  And I should see the text "Update Review"
  And I should not see the text "Make Review"
  And I click "Update Review"
  And I update the review
  Then I should see the text "Review updated!"
  Then I should see the submitted review
  And I should not see the text "Make Review"

@reviews-2
Scenario: Index and show review as customer
  Given I am signed in as a customer
  And 3 reivews from the customer are populated
  And I open the book
  Then I should see the submitted review
  Then I visit the customer reviews
  And I should see the customer reviews
  Then I open the review
  And I see the review show page
  And I should not see the text "Submitted by:"
  And I should see the text "Update"

@reviews-3
Scenario: Delete review as customer
  Given I am signed in as a customer
  And 1 reivews from the customer are populated
  Then I open the review
  And I should see the text "Delete"
  And I click "Delete"
  Then I should see the text "Review deleted"
  And 1 reivews from the customer are populated
  Then I visit the customer reviews
  And I should see the text "Delete"
  And I click "Delete"
  Then I should see the text "Review deleted"



