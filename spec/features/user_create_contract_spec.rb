require 'rails_helper'

feature 'User create contract' do
  scenario 'successfully' do
    equipment = create(:equipment)

    contract = create(:contract)

    visit root_path

    click_on 'Novo Contrato'

    fill_in 'Número do Contrato', with: contract.number
    fill_in 'Número do Pedido', with: contract.request_number
    fill_in 'Cliente', with: contract.customer
    fill_in 'Endereço', with: contract.address
    fill_in 'Contato', with: contract.contact
    fill_in 'Prazo', with: contract.deadline
    check(equipment.name)

    fill_in 'Data de Início', with: contract.start_date
    fill_in 'Data de Término', with: contract.end_date
    fill_in 'Preço', with: contract.price
    fill_in 'Desconto', with: contract.discount

    click_on 'Cadastrar Contrato'

    expect(page).to have_content contract.number
    expect(page).to have_content contract.request_number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.address
    expect(page).to have_content contract.contact
    expect(page).to have_content contract.deadline
    expect(page).to have_content equipment.name
    expect(page).to have_content contract.start_date
    expect(page).to have_content contract.end_date
    expect(page).to have_content contract.price
    expect(page).to have_content contract.discount
  end

  scenario 'multiple equipment' do
    equipment = create_list(:equipment, 6)

    contract = create(:contract)

    visit root_path

    click_on 'Novo Contrato'

    fill_in 'Número do Contrato', with: contract.number
    fill_in 'Número do Pedido', with: contract.request_number
    fill_in 'Cliente', with: contract.customer
    fill_in 'Endereço', with: contract.address
    fill_in 'Contato', with: contract.contact
    fill_in 'Prazo', with: contract.deadline

    equipment.each do |eq|
      check(eq.name)
    end

    fill_in 'Data de Início', with: contract.start_date
    fill_in 'Data de Término', with: contract.end_date
    fill_in 'Preço', with: contract.price
    fill_in 'Desconto', with: contract.discount

    click_on 'Cadastrar Contrato'

    expect(page).to have_content contract.number
    expect(page).to have_content contract.request_number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.address
    expect(page).to have_content contract.contact
    expect(page).to have_content contract.deadline

    equipment.each do |eq|
      expect(page).to have_content eq.name
    end

    expect(page).to have_content contract.start_date
    expect(page).to have_content contract.end_date
    expect(page).to have_content contract.price
    expect(page).to have_content contract.discount
  end
  scenario 'without equipment' do
    equipment = create(:equipment)

    contract = create(:contract)

    visit root_path

    click_on 'Novo Contrato'

    fill_in 'Número do Contrato', with: contract.number
    fill_in 'Número do Pedido', with: contract.request_number
    fill_in 'Cliente', with: contract.customer
    fill_in 'Endereço', with: contract.address
    fill_in 'Contato', with: contract.contact
    fill_in 'Prazo', with: contract.deadline

    fill_in 'Data de Início', with: contract.start_date
    fill_in 'Data de Término', with: contract.end_date
    fill_in 'Preço', with: contract.price
    fill_in 'Desconto', with: contract.discount

    click_on 'Cadastrar Contrato'

    expect(page).to have_content contract.number
    expect(page).to have_content contract.request_number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.address
    expect(page).to have_content contract.contact
    expect(page).to have_content contract.deadline
    expect(page).not_to have_content equipment.name
    expect(page).to have_content contract.start_date
    expect(page).to have_content contract.end_date
    expect(page).to have_content contract.price
    expect(page).to have_content contract.discount
  end

  scenario 'Fail' do
    visit root_path

    click_on 'Novo Contrato'

    click_on 'Cadastrar Contrato'

    expect(page).to have_content('Erro ao cadastrar contrato.')
  end
end
