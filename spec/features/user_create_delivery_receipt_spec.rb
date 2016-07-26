require 'rails_helper'

feature 'User create Delivery Receipt ' do
  scenario 'successfully in Show Mode' do
    equipment_list = create_list(:equipment, 3)
    contract = create(:contract, equipment: equipment_list)
    visit contract_path(contract)

    expect(page).not_to have_link 'Imprimir Recibo de Entrega'
    expect(page).not_to have_link 'Emitir Recibo de Devolução'
    expect(page).not_to have_link 'Imprimir Recibo de Devolução'
    click_on 'Emitir Recibo de Entrega'

    expect(page).to have_css('h1', 'Recibo de Entrega')
    expect(page).to have_content contract.contact
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.cnpj
    expect(page).to have_content contract.equipment_list_names
    expect(page).to have_content contract.deadline
    expect(page).to have_content contract.address
    expect(page).to have_content I18n.l(contract.start_date, format: :short)
    expect(page).to have_content contract.number
  end
end
