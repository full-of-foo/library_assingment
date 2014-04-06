# operations
Given(/^I submit a review$/) do
  @review = FactoryGirl.build(:review, customer: @customer)

  step("I fill in \"review_message\" with \"#{@review.message}\"")
  step("I press \"Create review\"")
end

Given(/^I update the review$/) do
  msg = "New message"
  step("I fill in \"review_message\" with \"#{msg}\"")
  step("I press \"Update review\"")

  @review.message = msg
end

Given(/^I visit the customer reviews$/) do
  visit(customer_reviews_path(@customer))
end

Given(/^I open the review$/) do
  visit(review_path(@review))
end

# assertions
Then(/^I should see the submitted review$/) do
 step("I should see the text \"Reviews:\"")
 step("I should see the text \"#{@review.customer.full_name}\"")
 step("I should see the text \"#{@review.message}\"")
end

Then(/^I should see the customer reviews$/) do
 step("I should see the text \"My Reviews\"")
 step("I should see the text \"#{@review.book.title}\"")
 step("I should see the text \"#{@review.message}\"")
end

Then(/^I see the review show page$/) do
 step("I should see the text \"Book Review: #{@review.book.title}\"")
 step("I should see the text \"#{@review.message}\"")
 step("I should see the text \"Made on:\"")
end
