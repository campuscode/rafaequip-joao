require 'rails_helper'

feature 'User print Received Receipt ' do
  scenario 'successfully in Show Mode' do
    equipment_list = create_list(:equipment, 3)
    contract = create(:contract, equipment: equipment_list)
    Receipt.create(contract_id: contract.id,
                   delivery_date: Time.zone.now)
    contract.create_received_receipt(responsible: 'Alan')

    visit contract_path(contract)

    click_on 'Imprimir Recibo de Devolução'

    expect(page).to have_css('h1', 'Recibo de Devolução')
    expect(page).to have_content contract.received_receipt.responsible
    expect(page).to have_content contract.equipment_list_names
    expect(page).to have_content contract.number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.cnpj
    expect(page).to have_content I18n.l(contract.end_date, format: :short)
  end

  scenario 'and dont Print Button' do
    equipment_list = create_list(:equipment, 3)
    contract = create(:contract, equipment: equipment_list)
    Receipt.create(contract_id: contract.id,
                   delivery_date: Time.zone.now)
    contract.create_received_receipt(responsible: 'Alan')

    visit contract_path(contract)

    expect(page).not_to have_link 'Emitir Recibo de Entrega'
    expect(page).not_to have_link 'Emitir Recibo de Devolução'
    expect(page).to have_link 'Imprimir Recibo de Entrega'
    expect(page).to have_link 'Imprimir Recibo de Devolução'
  end
end
