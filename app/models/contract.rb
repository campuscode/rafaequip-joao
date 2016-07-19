class Contract < ApplicationRecord
  validates :number, :request_number, :customer, :address, :contact, :deadline,
            :equipment, :start_date, :end_date, :price, presence: true
end
