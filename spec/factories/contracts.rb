FactoryGirl.define do
  factory :contract do
    sequence(:number) { |n| n }
    request_number 5678
    customer 'Campus Code'
    address 'Pamplona, 795'
    contact 'João de barro'
    deadline 10

    start_date Time.zone.today
    end_date Time.zone.today
    price 2500
    discount 5
    status true
  end
end
