
# Tear down
[User, Address].each(&:delete_all)

## Users
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
