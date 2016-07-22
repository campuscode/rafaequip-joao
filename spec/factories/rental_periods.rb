FactoryGirl.define do
  factory :rental_period do
    sequence(:period) { |n| n }
  end
end
