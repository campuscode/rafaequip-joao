FactoryGirl.define do
  factory :receipt do
    contract nil
    delivery_date Time.now.to_f
  end
end
