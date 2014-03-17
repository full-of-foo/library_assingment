FactoryGirl.define do

  factory :user do
    first_name            "Foo"
    surname               "McBar"
    email                 "foo@bar.com"
    password              "foobar"
    password_confirmation "foobar"
  end

end
