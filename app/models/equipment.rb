class Equipment < ApplicationRecord
  validates :code, :name, :serial_number, :supplier, :category, :price, :status,
            presence: true
  has_many :rented_equipment
end
