# assertions
Given(/^I should see an error message$/) do
  step("I should see the selector \"div.alert-danger\"")
end

Given(/^I see a 404 page$/) do
  page.status_code.should == 404
end
