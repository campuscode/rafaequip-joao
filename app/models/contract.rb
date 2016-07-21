class Contract < ApplicationRecord
  validates :number, :request_number, :customer, :address, :contact, :deadline,
            :start_date, :end_date, :price, presence: true
  has_many :rented_equipment
  has_many :equipment, through: :rented_equipment
end
