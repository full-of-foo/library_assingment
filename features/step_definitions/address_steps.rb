# operations
Given(/^I visit the address edit page$/) do
  visit (edit_customer_address_path(@customer, @address))
end

Given(/^I submit an address update$/) do
  step("I fill in \"address_line1\" with \"New\"")

  step('I press "Update billing address"')
  @address.line1 = "New"
end

Given(/^I submit a new address$/) do
  @address = FactoryGirl.create(:address)

  step("I fill in \"address_line1\" with \"#{@address.line1}\"")
  step("I fill in \"address_city\" with \"#{@address.city}\"")
  step("I fill in \"address_state\" with \"#{@address.state}\"")
  step("I fill in \"address_country\" with \"#{@address.country}\"")

  step('I press "Add billing address"')
end

# assertions
Then(/^I see the address listed$/) do
  step("I should see the selector \"li.content\"")
  step("I should see the text \"#{@address.line1}\"")
  step("I should see the text \"#{@address.city}\"")
  step("I should see the text \"#{@address.state}\"")
  step("I should see the text \"#{@address.country}\"")
end
