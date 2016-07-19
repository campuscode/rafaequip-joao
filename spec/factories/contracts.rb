FactoryGirl.define do
  factory :contract do
    number 1
    request_number 1
    customer 'MyString'
    address 'MyString'
    contact 'MyString'
    deadline 1
    equipment 'MyText'
    start_date '2016-07-18'
    end_date '2016-07-18'
    price 1.5
  end
end
