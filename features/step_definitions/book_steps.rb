# operations
Given(/^I search for the book title$/) do
  step("I fill in \"search\" with \"#{@book.title}\"")
  step("I press \"Search\"")
end

Given(/^I open the book$/) do
  visit book_path(@book)
end

Given(/^I open the first book$/) do
  step("I click \"#{@book.title}\"")
end

# assertions
Then(/^I see the books page$/) do
  step("I should see the text \"Books\"")
  step("I should see the selector \"ul.pagination.pagination\"")
  step("I should see the selector \"li.active\"")
end

Then(/^I see the book show page$/) do
  step("I should see the text \"Showing Book: #{@book.title}\"")
  step("I should see the text \"#{@author.full_name}\"")
  step("I should see the text \"#{@topic.title}\"")
end

Then(/^I see the searched book$/) do
  step("I should not see the selector \"ul.pagination.pagination\"")
  step("I should see the text \"#{@book.title}\"")
  step("I should see the text \"#{@author.full_name}\"")
  step("I should see the text \"#{@topic.title}\"")
end
