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

  factory :author do
    sequence(:full_name) { |n| "Some author #{n}" }
  end

  factory :topic do
    sequence(:title) { |n| "Some topic #{n}" }
  end

  factory :book do
    sequence(:title)  { |n| "Some book title #{n}" }
    sequence(:price)  { |n| ((((100.0 - 5.0) * rand() + 5) * 100).round / 100.0) }
    association :author, factory: :author
    association :topic, factory: :topic
  end

  factory :book_stock do
    association :book, factory: :book
  end

  factory :purchase do
    association :address, factory: :book
    association :customer, factory: :customer
  end

  factory :book_purchase_item do
    association :book, factory: :book
    association :purchase, factory: :purchase
  end

  factory :signup do
    association :customer, factory: :customer, strategy: :build
    association :address, factory: :address, strategy: :build
  end

end
