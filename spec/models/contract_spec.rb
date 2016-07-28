require 'rails_helper'

RSpec.describe Contract, type: :model do
  describe 'Calculate price' do
    it 'has 2 equipment' do
      equipment = create_pair(:equipment)
      rental_period = create(:rental_period, period: 15)

      create(:price, rental_period: rental_period, equipment: equipment[0],
                     amount: 1500)
      create(:price, rental_period: rental_period, equipment: equipment[1],
                     amount: 1500)

      contract = build(:contract, rental_period: rental_period)
      contract.equipment << equipment
      contract.save!
      expect(contract.price).to eq 3000.0
    end
  end

  describe '#contract_status' do
    context 'open' do
      it 'prints Aberto' do
        equipment = create_pair(:equipment)
        rental_period = create(:rental_period, period: 15)

        create(:price, rental_period: rental_period, equipment: equipment[0],
                       amount: 1500)
        create(:price, rental_period: rental_period, equipment: equipment[1],
                       amount: 1500)

        contract = build(:contract, rental_period: rental_period)
        contract.equipment << equipment
        contract.save!
        expect(contract.contract_status).to eq 'Aberto'
      end
    end

    context 'closed' do
      it 'prints Fechado' do
        equipment = create_pair(:equipment)
        rental_period = create(:rental_period, period: 15)

        create(:price, rental_period: rental_period, equipment: equipment[0],
                       amount: 1500)
        create(:price, rental_period: rental_period, equipment: equipment[1],
                       amount: 1500)

        contract = build(:contract, rental_period: rental_period)
        contract.equipment << equipment
        contract.save!
        contract.closed!
        expect(contract.contract_status).to eq 'Fechado'
      end
    end
  end
end
