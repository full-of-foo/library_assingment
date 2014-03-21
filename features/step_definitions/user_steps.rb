# operations
Given(/^I visit the (customer|admin) (show|edit) page$/) do |customer_or_admin, show_or_edit|
  is_show = show_or_edit == "show"
  user    = customer_or_admin == "customer" ? @customer : @admin
  url     = is_show ? user_path(user) : sti_user_path(user.type, user, "edit")

  visit url
end

Given(/^I submit an invalid signup$/) do
  step("I fill in \"user_email\" with \"wrong@bar\"")

  step('I press "Create my account"')
end

Given(/^I submit the customer signup$/) do
  @customer = FactoryGirl.build(:customer)
  step("I fill in \"user_email\" with \"#{@customer.email}\"")
  step("I fill in \"user_first_name\" with \"#{@customer.first_name}\"")
  step("I fill in \"user_surname\" with \"#{@customer.surname}\"")
  step("I fill in \"user_password\" with \"#{@customer.password}\"")
  step("I fill in \"user_password_confirmation\" with \"#{@customer.password}\"")

  step('I press "Create my account"')
end

Given(/^I submit a new admin$/) do
  @new_admin = FactoryGirl.build(:admin, email: "new_admin@foo.com")
  step("I fill in \"user_email\" with \"#{@new_admin.email}\"")
  step("I fill in \"user_first_name\" with \"#{@new_admin.first_name}\"")
  step("I fill in \"user_surname\" with \"#{@new_admin.surname}\"")
  step("I fill in \"user_password\" with \"#{@new_admin.password}\"")
  step("I fill in \"user_password_confirmation\" with \"#{@new_admin.password}\"")

  step('I press "Create Admin"')
end

Given(/^I submit (a customer|an admin) update$/) do |customer_or_admin|
  user = customer_or_admin == "an admin" ? @admin : @customer

  step("I fill in \"user_email\" with \"#{user.email}\"")
  step("I fill in \"user_first_name\" with \"New\"")
  step("I fill in \"user_password\" with \"#{user.password}\"")
  step("I fill in \"user_password_confirmation\" with \"#{user.password}\"")

  step('I press "Update Account"')
  if customer_or_admin == "an admin"
    @admin.first_name = "New"
  else
    @customer.first_name = "New"
  end
end

Given(/^I submit an invalid (customer|admin) update$/) do |customer_or_admin|
  step("I fill in \"user_email\" with \"bad\"")
  step('I press "Update Account"')
end

Given(/^the customers and admins are populated$/) do
  15.times { FactoryGirl.create(:customer) }
  15.times { FactoryGirl.create(:admin) }
end

Given(/^I delete the first customer$/) do
  step("I click \"delete\"")
end

# assertions
Given(/^I see the customer profile page$/) do
  step("I should see the text \"Showing Profile: #{@customer.full_name}\"")
  step("I should see the text \"Update\"")
  step("I should see the text \"Delete Account\"")
end

Given(/^I see the admin profile page$/) do
  step("I should see the text \"Showing Profile: #{@admin.full_name}\"")
  step("I should see the text \"Update\"")
  step("I should see the text \"Delete Account\"")
end

Given(/^I see the customer edit profile page$/) do
  step("I should see the text \"Editing Profile: #{@customer.full_name}\"")
  step("I should see the selector \"input#user_first_name\"")
  step("I should see the selector \"input#user_surname\"")
  step("I should see the selector \"input#user_password\"")
end

Given(/^I see the admin edit profile page$/) do
  step("I should see the text \"Editing Profile: #{@admin.full_name}\"")
  step("I should see the selector \"input#user_first_name\"")
  step("I should see the selector \"input#user_surname\"")
  step("I should see the selector \"input#user_password\"")
end

Given(/^I see the users page$/) do
  step("I should see the text \"All users\"")
  step("I should see the selector \"ul.pagination.pagination\"")
  step("I should see the selector \"li.active\"")
end


