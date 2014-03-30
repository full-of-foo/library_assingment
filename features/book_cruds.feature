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
  Then I click "Stock"
  And I should see the selector "th#stock-count a.current.asc"
  Then I click "Stock"
  And I should see the selector "th#stock-count a.current.desc"
  Then I search for the book title
  Then I see the searched book

@book_cruds-3
Scenario: Books show and update stock level as admin
  Given I am signed in as a admin
  And a book is populated
  Then I open the book
  And I see the book show page
  And I should see the text "Stock Levels:"
  And I should see the selector "select#stock_count"
  Then I press "Update"
  And I should see the text "Stock amount unchanged"
  Then I select "1" from "stock_count"
  Then I press "Update"
  And I should see the text "Stock amount increased"
  Then I select "0" from "stock_count"
  Then I press "Update"
  And I should see the text "Stock amount decreased"

@book_cruds-4
Scenario: Books show as customer
  Given I am signed in as a customer
  And a book is populated
  Then I visit "/books"
  And I open the first book
  And I see the book show page
  And I should see the text "Stock Levels:"
  And I should not see the selector "select#stock_count"
  And I should see the text "0"
  And I should see the text "Cannot purchase book :("
  Then "2" stocks of the book are populated
  Then I visit "/books"
  And I open the first book
  And I should see the text "2"
  And I should see the selector "select#quantity"
  And I should see the text "Purchase"
