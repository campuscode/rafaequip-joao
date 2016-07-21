FactoryGirl.define do
  factory :equipment do
    sequence(:code) { |n| "FU#{n}" }
    sequence(:name) { |n| "Furadeira_#{n}" }
    sequence(:serial_number, &:to_s)
    supplier 'Fornecedor'
    category 'Furadeira'
    price 1.5
    status 'Disponível'
  end
end
