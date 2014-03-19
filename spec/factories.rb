FactoryGirl.define do
  factory :customer do
    sequence(:first_name) { |n| "Some" }
    sequence(:surname)    { |n| "Cusotmer #{n}" }
    sequence(:email)      { |n| "customer_#{n}@foo.com"}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :admin do
    sequence(:first_name) { |n| "Some" }
    sequence(:surname)    { |n| "Admin #{n}" }
    sequence(:email)      { |n| "admin_#{n}@foo.com"}
    password "foobar"
    password_confirmation "foobar"
  end
end
