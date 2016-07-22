require 'rails_helper'

feature 'User print Delivery Receipt ' do
  scenario 'in Show Mode' do
    contract = create(:contract)
    visit contract_path(contract)

    click_on 'Imprimir Recibo de Entrega'

    expect(page).to have_css('h1', 'Recibo de Entrega')
    expect(page).to have_content contract.contact
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.customer.cnpj
    expect(page).to have_content contract.equipment_list_names
    expect(page).to have_content contract.start_date
    expect(page).to have_content contract.end_date
    expect(page).to have_content contract.address
    expect(page).to have_content I18n.l(Time.now, format: :short)
    expect(page).to have_content contract.number

  end

  scenario 'in Edit Mode' do
    contract = create(:contract)
    visit edit_contract_path(contract)

    click_on 'Imprimir Recibo de Entrega'

    expect(page).to have_css('h1', 'Recibo de Entrega')
    expect(page).to have_content contract.contact
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.customer.cnpj
    expect(page).to have_content contract.equipment_list_names
    expect(page).to have_content contract.start_date
    expect(page).to have_content contract.end_date
    expect(page).to have_content contract.address
    expect(page).to have_content I18n.l(Time.now, format: :short)
    expect(page).to have_content contract.number

  end



end
