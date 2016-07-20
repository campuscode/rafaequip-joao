FactoryGirl.define do
  factory :equipment do
    code 'Fur_01'
    name 'Furadeira de alto impacto'
    serial_number 12_345
    supplier 'Bosh'
    category 'furadeira'
    price 2500
    status 'Alugado'
  end
end
