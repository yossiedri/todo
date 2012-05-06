# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todotask do
    title "MyString"
    duedate "2012-05-06 10:23:44"
    description "MyText"
  end
end
