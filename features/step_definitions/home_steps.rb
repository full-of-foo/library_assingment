# Assertions
Given(/^I see the sessionless home page$/) do
  step('I should see the text "A crappy book store, "')

  step('I should see the selector "a[href^=\'/about\']"')
  step('I should see the selector "a[href^=\'/help\']"')
  step('I should see the selector "a[href^=\'/signin\']"')
end
