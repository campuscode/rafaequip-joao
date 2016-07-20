FactoryGirl.define do
  factory :proposal do
    name 'João'
    sequence(:email) { |n| "joao#{n}@campuscode.com" }
    phone '98731224'
    description 'solicito orçamento de 10 betoneiras'
  end
end
