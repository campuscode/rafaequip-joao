require 'rails_helper'

feature 'User create Received Receipt' do
  scenario 'successfully in Show Mode' do
    equipment_list = create_list(:equipment, 3)
    contract = create(:contract, equipment: equipment_list)
    Receipt.create(contract_id: contract.id)

    visit contract_path(contract)

    fill_in 'Responsável', with: 'Temer'

    click_on 'Emitir Recibo de Devolução'

    expect(page).to have_content 'Recibo criado com sucesso.'
    expect(page).to have_css('h1', 'Recibo de Devolução')
    expect(page).to have_content contract.received_receipt.responsible
    expect(page).to have_content contract.equipment_list_names
    expect(page).to have_content contract.number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.cnpj
    expect(page).to have_content I18n.l(contract.end_date, format: :short)
  end

  scenario 'without valid data' do
    equipment_list = create_list(:equipment, 3)
    contract = create(:contract, equipment: equipment_list)
    Receipt.create(contract_id: contract.id)

    visit contract_path(contract)

    click_on 'Emitir Recibo de Devolução'

    expect(page).to have_content 'Erro, falta o nome do responsável'

  end

end
