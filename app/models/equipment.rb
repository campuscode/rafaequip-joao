class Equipment < ApplicationRecord
  validates :code, :name, :serial_number, :supplier, :category, :price, :status,
            presence: true
  has_many :rented_equipment
  has_many :prices

  def price_for(rental_period)
    prices.find_by(rental_period: rental_period).try(:amount) || 0
  end
end
