FactoryGirl.define do
  factory :equipment do
    sequence(:code){ |n| "FU#{n}" }
    name "Furadeira"
    sequence(:serial_number){ |n| "#{n}" }
    supplier "Fornecedor"
    category "Furadeira"
    price 1.5
    status "Disponível"
  end
end
