FactoryGirl.define do
  factory :rental_period do
    sequence(:period) { |n| n + 1 }
  end
end
