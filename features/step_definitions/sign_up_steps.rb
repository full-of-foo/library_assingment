# operations

Given(/^I submit the customer signup$/) do
  @signup   = FactoryGirl.build(:signup)
  @customer = @signup.customer
  @address  = @signup.address

  step("I fill in \"signup_email\" with \"#{@customer.email}\"")
  step("I fill in \"signup_first_name\" with \"#{@customer.first_name}\"")
  step("I fill in \"signup_surname\" with \"#{@customer.surname}\"")
  step("I fill in \"signup_password\" with \"#{@customer.password}\"")
  step("I fill in \"signup_password_confirmation\" with \"#{@customer.password}\"")

  step("I fill in \"signup_line1\" with \"#{@address.line1}\"")
  step("I fill in \"signup_city\" with \"#{@address.city}\"")
  step("I fill in \"signup_state\" with \"#{@address.state}\"")
  step("I fill in \"signup_country\" with \"#{@address.country}\"")

  step('I press "Create my account"')
end

Given(/^I submit an invalid signup$/) do
  step("I fill in \"signup_email\" with \"wrong@bar\"")

  step('I press "Create my account"')
end
