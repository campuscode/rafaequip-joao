class Contract < ApplicationRecord
  validates :number, :request_number, :customer, :address, :contact, :deadline,
            :start_date, :end_date, :price, presence: true
  has_many :rented_equipment
  has_many :equipment, through: :rented_equipment
  has_one :receipt

  def equipment_list_names
    list = ''

    equipment.each do |eq|
      list << "#{eq.serial_number} / #{eq.name}, "
    end
  end
end
