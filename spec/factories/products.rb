FactoryGirl.define do
  factory :product do
    name "blah"
    description "blah"
    price 20
    minimum_age_appropriate 0
    maximum_age_appropriate 100
  end
end
