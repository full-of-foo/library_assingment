#operations
Given(/^the customers and admins are populated$/) do
  15.times { FactoryGirl.create(:customer) }
  15.times { FactoryGirl.create(:admin) }
end

Given(/^a customer is populated$/) do
  @customer = FactoryGirl.create(:customer)
end

Given(/^a book is populated$/) do
  @book = FactoryGirl.create(:book)

  @author = @book.author
  @topic  = @book.topic
end

Given(/^(.+) stocks of the book are populated$/) do |count_str|
  count_str.to_i.times { FactoryGirl.create(:book_stock, book: @book) }
end

Given(/^an address is populated$/) do
  @address  = FactoryGirl.create(:address)
  @customer = @address.customer
end

Given(/^the books are populated$/) do
  41.times { @book = FactoryGirl.create(:book) }

  @author = @book.author
  @topic  = @book.topic
end

Given(/^(.+) addresses are populated$/) do |count_str|
  count_str.to_i.times {
    @address  = @customer ? FactoryGirl.create(:address, customer: @customer) : FactoryGirl.create(:address)
    @customer = @address.customer
  }
end

# assertions
Given(/^I should see an error message$/) do
  step("I should see the selector \"div.alert-danger\"")
end

Given(/^I see a 404 page$/) do
  page.status_code.should == 404
end
