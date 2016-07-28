require 'rails_helper'

RSpec.describe Equipment, type: :model do
  describe '#price_for' do
    it '15 days' do
      equipment = create(:equipment)
      rental_period = RentalPeriod.new(period: 15)
      create(:price, equipment: equipment,
                     rental_period: rental_period, amount: 1500)
      expect(equipment.price_for(rental_period)).to eq 1500.0
    end
  end
end
