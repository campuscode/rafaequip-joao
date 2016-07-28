require 'rails_helper'

feature 'User view Contracts' do
  scenario 'successfully' do
    equipment = create_pair(:equipment)
    rental_period = create(:rental_period, period: 15)

    create(:price, rental_period: rental_period, equipment: equipment[0],
                   amount: 1500)
    create(:price, rental_period: rental_period, equipment: equipment[1],
                   amount: 1500)
    contracts = build_list(:contract, 5)
    contracts.each do |contract|
      contract.equipment << equipment
      contract.save!
    end

    visit contracts_path
    contracts.each do |contract|
      expect(page).to have_link(contract.number)
      expect(page).to have_content(contract.customer)
      expect(page).to have_content 'Status'
      expect(page).to have_content 'Aberto'
    end
  end
end
