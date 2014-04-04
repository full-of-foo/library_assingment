# assertions
Then(/^I see the cart show page$/) do
  step("I should see the text \"Shopping Cart\"")
  step("I should see the text \"Total Cost:\"")
  step("I should see the text \"Clear all\"")
end

Then(/^I see the carted book$/) do
  step("I should see the text \"#{@book.title}\"")
  step("I should see the text \"#{@book.author.full_name}\"")
end
