require 'rails_helper'

feature 'User finalized contract' do
  scenario 'successfully' do
    equipment = create(:equipment)
    period = create(:rental_period, period: 15)
    price = create(:price, rental_period: period, equipment: equipment)
    contract = create(:contract, rental_period: period)
    create(:rented_equipment, contract: contract, equipment: equipment)

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
