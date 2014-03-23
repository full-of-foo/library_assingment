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


  factory :address do
    sequence(:line1)  { |n| "Some Street #{n}" }
    sequence(:city)   { |n| "Some City #{n}" }
    sequence(:state)  { |n| "Some State #{n}" }
    country "Ireland"
    association :customer, factory: :customer
  end

  factory :signup do
    association :customer, factory: :customer, strategy: :build
    association :address, factory: :address, strategy: :build
  end

end
