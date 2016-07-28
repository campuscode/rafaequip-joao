require 'rails_helper'

feature 'User view contract price' do
  scenario 'succesfully' do
    equipment = create(:equipment)
    contract = build(:contract, discount: 5)
    rental_period = create(:rental_period, period: 15)
    today = Time.zone.today
    tomorrow = today + 1
    visit root_path

    click_on 'Novo Contrato'

    fill_in 'Número do Contrato', with: contract.number
    fill_in 'Número do Pedido', with: contract.request_number
    fill_in 'Cliente', with: contract.customer
    fill_in 'Endereço', with: contract.address
    fill_in 'Contato', with: contract.contact
    select  rental_period.period, from: 'Prazo'
    check(equipment.name)
    fill_in 'Data de Início', with: today
    fill_in 'Data de Término', with: tomorrow
    fill_in 'Desconto', with: contract.discount

    click_on 'Cadastrar Contrato'

    expect(page).to have_content contract.number
    expect(page).to have_content contract.request_number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.address
    expect(page).to have_content contract.contact
    expect(page).to have_content rental_period.period
    expect(page).to have_content equipment.name
    expect(page).to have_content I18n.l(today)
    expect(page).to have_content I18n.l(tomorrow)
    expect(page).to have_content number_to_currency contract.discount
    expect(page).to have_content number_to_currency Contract.last.price
    expect(page).to have_content
    number_to_currency Contract.last.price - contract.discount
  end
end
