require 'rails_helper'

feature 'User finalized contract' do
  scenario 'successfully' do
    equipment = create_pair(:equipment)
    rental_period = create(:rental_period, period: 15)
    create(:price, rental_period: rental_period, equipment: equipment[0],
                   amount: 30)
    create(:price, rental_period: rental_period, equipment: equipment[1],
                   amount: 60)

    rented_equipment = equipment.map do |e|
      build(:rented_equipment, equipment: e)
    end

    contract = create(:contract, rental_period: rental_period,
                                 rented_equipment: rented_equipment)

    contract.create_receipt
    contract.create_received_receipt(responsible: 'Alan')

    visit contract_path(contract)

    click_on 'Encerrar Contrato'

    expect(page).to have_content 'Fechado'
    expect(page).to have_content contract.number
    expect(page).to have_content contract.request_number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.address
    expect(page).to have_content contract.contact
    expect(page).to have_content contract.rental_period.period
  end
end
