# operations
Given(/^I submit an unknown user login$/) do
  step("I fill in \"session_email\" with \"wrong@bar.com\"")
  step("I fill in \"session_password\" with \"foobar\"")

  step("I press \"Sign in\"")
end

Given(/^I submit a known customer login$/) do
  @customer = FactoryGirl.create(:customer)

  step("I submit the customer login")
end

Given(/^I submit a known admin login$/) do
  @admin = FactoryGirl.create(:admin)

  step("I submit the admin login")
end

Given(/^I submit the (customer|admin) login$/) do |cus_or_admin|
  user = cus_or_admin == "admin" ? @admin : @customer

  step("I fill in \"session_email\" with \"#{user.email}\"")
  step("I fill in \"session_password\" with \"#{user.password}\"")

  step("I press \"Sign in\"")
end

Given(/^I am signed in as a (customer|admin)$/) do |cus_or_admin|
  if cus_or_admin == "admin"
    @admin ||= FactoryGirl.create(:admin)
  else
    @customer ||= FactoryGirl.create(:customer)
  end

  sign_in(@admin || @customer, no_capybara: true)
end

Given(/^I sign out$/) do
  step("I click \"sign-out-link\"")
end

include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    visit "/"
    remember_token = ApplicationController.helpers.new_remember_token()
    page.driver.browser.set_cookie("remember_token=#{remember_token}")
    user.update_attribute(:remember_token, ApplicationController
                            .helpers.hash_token(remember_token))
  else
    visit signin_path
    fill_in "session_email",    with: user.email
    fill_in "session_password", with: user.password
    click_button "Sign in"
  end
end
