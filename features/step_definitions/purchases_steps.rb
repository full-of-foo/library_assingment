# operations
Given(/^I visit the customer purchase history$/) do
  page.visit customer_purchases_path(@customer)
end

Given(/^I visit the cart show page$/) do
  page.visit cart_show_path()
end

# assertions
Then(/^I see the book checkout page$/) do
  step("I should see the text \"Checkout books\"")
  step("I should see the text \"Billing Address:\"")
end

Then(/^I see the book purchase history item$/) do
  step("I should see the text \"#{@purchase.total_cost}\"")
  step("I should see the text \"#{format_books_as_string(@purchase.books)}\"")
  step("I should see the text \"#{@purchase.address.to_formatted_s}\"")
end
