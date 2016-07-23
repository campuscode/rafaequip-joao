require 'rails_helper'

feature 'User create Received Receipt' do
  scenario 'successfully in Show Mode' do
    equipment_list = create_list(:equipment, 3)
    contract = create(:contract, equipment: equipment_list)
    receipt = Receipt.create(contract_id: contract.id,
                              delivery_date: Time.zone.now)


    visit contract_path(contract)

    expect(page).to have_link 'Imprimir Recibo de Entrega'

    fill_in 'Responsável', with: 'Temer'

    click_on 'Emitir Recibo de Devolução'

    expect(page).to have_css('h1', 'Recibo de Devolução')
    expect(page).to have_content contract.received_receipt.name
    expect(page).to have_content contract.equipment_list_names
    expect(page).to have_content contract.number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.cnpj
    expect(page).to have_content contract.deadline
    expect(page).to have_content contract.address
    expect(page).to have_content I18n.l(contract.end_date, format: :short)
  end



end
