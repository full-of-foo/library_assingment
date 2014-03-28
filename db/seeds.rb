
# Tear down
[User, Address].each(&:delete_all)


# test admin
Admin.create!(first_name: "Example",
             surname: "User",
             email: "lightweightdevelopment@gmail.com",
             password: "foobar",
             password_confirmation: "foobar")

# customers
14.times do |n|
  name      = Faker::Name.first_name
  surname   = Faker::Name.last_name
  email     = "customer-#{n+1}@foo.org"
  password  = "foobar"
  Customer.create!(first_name: name,
               surname: surname,
               email: email,
               password: password,
               password_confirmation: password)
end


# admins
14.times do |n2|
  name      = Faker::Name.first_name
  surname   = Faker::Name.last_name
  email     = "admin-#{n2+1}@foo.org"
  password  = "foobar"
  Admin.create!(first_name: name,
               surname: surname,
               email: email,
               password: password,
               password_confirmation: password)
end


# addresses
28.times do |n3|
  faker_address = Faker::Address
  offset = n3 - Customer.count if n3 >= Customer.count

  Address.create!(line1: faker_address.street_name,
                  city: faker_address.city,
                  zip: faker_address.zip,
                  state: faker_address.state,
                  country: faker_address.country,
                  customer: Customer.first(offset: (offset || n3)))
end


# topics
%w(fiction horror politics romance eduction sci-fi thriller
    biography religion comedy philosophy).each do |title|
  Topic.create!(title: title)
end

# authors
%w(Veronica\ Roth Nora\ Roberts James\ Patterson John\ Green Lee\ Child
   Stephen\ King Brene\ Brown ).each do |full_name|
  Author.create!(full_name: full_name)
end

# books
41.times do
  Book.create!(title: Faker::Lorem.words.join(' '),
               price: ((((100.0 - 5.0) * rand() + 5) * 100).round / 100.0),
               author: Author.order("RANDOM()").first,
               topic: Topic.order("RANDOM()").first)
end



