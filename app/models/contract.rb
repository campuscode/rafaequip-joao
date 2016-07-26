class Contract < ApplicationRecord
  validates :number, :request_number, :customer, :address, :contact, :rental_period,
            :start_date, :end_date, presence: true
  has_many :rented_equipment
  has_many :equipment, through: :rented_equipment
  has_one :receipt
  belongs_to :rental_period

  def equipment_list_names
    list = ''

    equipment.each do |eq|
      list << "#{eq.serial_number} / #{eq.name}, "
    end
    list
  end
end
