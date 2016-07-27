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

  describe '#contract_status' do
    context 'open' do
      it 'prints Aberto' do
        contract = Contract.new
        expect(contract.contract_status).to eq 'Aberto'
      end
    end

    context 'closed' do
      it 'prints Fechado' do
        contract = build :contract
        contract.closed!
        expect(contract.contract_status).to eq 'Fechado'
      end
    end
  end
end
