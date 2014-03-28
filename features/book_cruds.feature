@book_cruds

Feature: Books cruds

@book_cruds-1
Scenario: Books index as admin
  Given I am signed in as a admin
  And the books are populated
  Then I visit "/books"
  And I see the books page

@book_cruds-2
Scenario: Books index, sorting and searching as customer
  Given I am signed in as a customer
  And the books are populated
  Then I visit "/"
  Then I click "Books"
  And I see the books page
  Then I click "Title"
  And I should see the selector "th#book-title a.current.asc"
  Then I click "Title"
  And I should see the selector "th#book-title a.current.desc"
  Then I click "Price"
  And I should see the selector "th#book-price a.current.asc"
  Then I click "Price"
  And I should see the selector "th#book-price a.current.desc"
  Then I click "Author"
  And I should see the selector "th#author-name a.current.asc"
  Then I click "Author"
  And I should see the selector "th#author-name a.current.desc"
  Then I click "Topic"
  And I should see the selector "th#topic-title a.current.asc"
  Then I click "Topic"
  And I should see the selector "th#topic-title a.current.desc"
  Then I search for the book title
  Then I see the searched book



