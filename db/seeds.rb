
# Tear down
[User].each(&:delete_all)

## Users
# test admin
Admin.create!(first_name: "Example",
             surname: "User",
             email: "lightweightdevelopment@gmail.com",
             password: "foobar",
             password_confirmation: "foobar")

# customers
44.times do |n|
  name      = Faker::Name.first_name
  surname   = Faker::Name.last_name
  email     = "customer-#{n+1}@foo.org"
  password  = "password"
  Customer.create!(first_name: name,
               surname: surname,
               email: email,
               password: password,
               password_confirmation: password)
end

# admins
20.times do |n|
  name      = Faker::Name.first_name
  surname   = Faker::Name.last_name
  email     = "admin-#{n+1}@foo.org"
  password  = "password"
  Admin.create!(first_name: name,
               surname: surname,
               email: email,
               password: password,
               password_confirmation: password)
end
