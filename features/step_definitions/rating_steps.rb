# assertions
Then(/^I should see the average rating$/) do
 step("I should see the text \"Average Rating: #{@book.average_rating} (#{@book.ratings.size} votes)\"")
end

Then(/^I should see the customer rating$/) do
 step("I should see the selector \"#rating_amount[value='#{@rating.amount}']\"")
end
