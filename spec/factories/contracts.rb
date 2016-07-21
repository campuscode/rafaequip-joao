FactoryGirl.define do
  factory :contract do
    number 1234
    request_number 5678
    customer
    address 'Pamplona, 795'
    contact 'João de barro'
    deadline 10

    start_date Date.new
    end_date Date.new
    price 2500
    discount 5
  end
end
