require 'rails_helper'

RSpec.describe Contract, type: :model do
  describe '#set_price' do
    it 'has 2 equipment' do
      equip = create_pair(:equipment)
      rp = RentalPeriod.new(period: 15)
      create(:price, equipment: equip[0], rental_period: rp)
      create(:price, equipment: equip[1], rental_period: rp)
      contract = create(:contract, equipment: equip, rental_period: rp)
      expect(contract.price).to eq 3000.0
    end
  end
end
