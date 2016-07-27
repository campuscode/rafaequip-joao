require 'rails_helper'

feature 'User finalized contract' do
  scenario 'successfully' do
    contract = create(:contract)
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
