require 'rails_helper'

feature 'User create contract' do
  scenario 'successfully' do
    equipment = create(:equipment)
    period = create(:rental_period, period: 15)
    price = create(:price, rental_period: period, equipment: equipment)
    contract = build(:contract, rental_period: period)

    visit root_path

    click_on 'Novo Contrato'

    fill_in 'Número do Contrato', with: contract.number
    fill_in 'Número do Pedido', with: contract.request_number
    fill_in 'Cliente', with: contract.customer
    fill_in 'Endereço', with: contract.address
    fill_in 'Contato', with: contract.contact
    select  15, from: 'Prazo'
    check(equipment.name)

    fill_in 'Data de Início', with: contract.start_date
    fill_in 'Data de Término', with: contract.end_date
    fill_in 'Desconto', with: contract.discount

    click_on 'Cadastrar Contrato'

    expect(page).to have_content 'Aberto'
    expect(page).to have_content contract.number
    expect(page).to have_content contract.request_number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.address
    expect(page).to have_content contract.contact
    expect(page).to have_content contract.rental_period.period
    expect(page).to have_content equipment.name
    expect(page).to have_content I18n.l(contract.start_date)
    expect(page).to have_content I18n.l(contract.end_date)
    expect(page).to have_content number_to_currency(contract.price)
    expect(page).to have_content number_to_currency(contract.discount)
  end

  scenario 'multiple equipment' do
    equipment = create_list(:equipment, 6)

    period = create(:rental_period, period: 15)
    equipment.each do |e|
      price = create(:price, rental_period: period, equipment: e)
    end

    contract = build(:contract, rental_period: period)

    visit root_path

    click_on 'Novo Contrato'

    fill_in 'Número do Contrato', with: contract.number
    fill_in 'Número do Pedido', with: contract.request_number
    fill_in 'Cliente', with: contract.customer
    fill_in 'Endereço', with: contract.address
    fill_in 'Contato', with: contract.contact
    select  15, from: 'Prazo'

    equipment.each do |eq|
      check(eq.name)
    end

    fill_in 'Data de Início', with: contract.start_date
    fill_in 'Data de Término', with: contract.end_date
    fill_in 'Desconto', with: contract.discount

    click_on 'Cadastrar Contrato'

    expect(page).to have_content contract.number
    expect(page).to have_content contract.request_number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.address
    expect(page).to have_content contract.contact
    expect(page).to have_content contract.rental_period.period
    expect(page).to have_content 'Aberto'

    equipment.each do |eq|
      expect(page).to have_content eq.name
    end

    expect(page).to have_content I18n.l(contract.start_date)
    expect(page).to have_content I18n.l(contract.end_date)
    expect(page).to have_content number_to_currency(contract.price)
    expect(page).to have_content number_to_currency(contract.discount)
  end
  scenario 'without equipment' do
    equipment = create(:equipment)

    period = create(:rental_period, period: 15)

    contract = build(:contract, rental_period: period)

    visit root_path

    click_on 'Novo Contrato'

    fill_in 'Número do Contrato', with: contract.number
    fill_in 'Número do Pedido', with: contract.request_number
    fill_in 'Cliente', with: contract.customer
    fill_in 'Endereço', with: contract.address
    fill_in 'Contato', with: contract.contact
    select  15, from: 'Prazo'

    fill_in 'Data de Início', with: contract.start_date
    fill_in 'Data de Término', with: contract.end_date
    fill_in 'Desconto', with: contract.discount

    click_on 'Cadastrar Contrato'

    expect(page).to have_content 'Erro ao cadastrar contrato.'
  end

  scenario 'contract valid' do
    visit root_path

    click_on 'Novo Contrato'

    click_on 'Cadastrar Contrato'

    expect(page).to have_content('Erro ao cadastrar contrato.')
  end
end
