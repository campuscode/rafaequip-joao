FactoryGirl.define do
  factory :contract do
    sequence(:number) { |n| n }
    request_number 5678
    customer 'Campus Code'
    address 'Pamplona, 795'
    contact 'João de barro'
    rental_period
    start_date Time.zone.today
    end_date Time.zone.today
    discount 5
    status 'open'
  end
end
