# Operations
Given /^I visit "(.+)"$/ do |page_name|
  visit page_name
end

Given /^I visit "(.+)" and get a 404$/ do |page_name|
  visit page_name
  page.status_code.should be(404)
end

Given /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

Given /^I click "([^\"]*)"$/ do |link|
  click_link(link, match: :first)
end

Given /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field.gsub(' ', '_'), :with => value)
end

Given /^I fill in "([^\"]*)" for "([^\"]*)"$/ do |value, field|
  fill_in(field.gsub(' ', '_'), :with => value)
end

Given /^I fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    Given %{I fill in "#{name}" with "#{value}"}
  end
end

Given /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

Given /^I check "([^\"]*)"$/ do |field|
  check(field)
end

Given /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end

Given /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end


# Assertions
Then /^I should see the text "([^\"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see the selector "([^\"]*)"$/ do |selector|
  page.should have_selector(selector)
end

Then /^I should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  page.should have_content(regexp)
end

Then /^I should not see the text "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should not see the selector "([^\"]*)"$/ do |selector|
  page.should_not have_selector(selector)
end

Then /^I should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  page.should_not have_content(regexp)
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  find_field(field).value.should =~ /#{value}/
end

Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  find_field(field).value.should_not =~ /#{value}/
end

Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  find_field(label).should be_checked
end

Then /^the "([^\"]*)" checkbox should not be checked$/ do |label|
  find_field(label).should_not be_checked
end
