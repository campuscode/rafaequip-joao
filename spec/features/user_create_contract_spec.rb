require 'rails_helper'

feature 'User create contract' do
  scenario 'successfully' do

    contract = Contract.new(number: 1234,
                            request_number: 5678,
                            customer: 'Campus Code',
                            address: 'Pamplona, 795',
                            contact: 'João de barro',
                            deadline: 10,
                            equipment: 'Furadeira',
                            start_date: Date.new,
                            end_date: Date.new+1,
                            price: 2500,
                            discount: 5
                            )

    visit root_path

    click_on 'Novo Contrato'

    fill_in 'Número do Contrato', with: contract.number
    fill_in 'Número do Pedido', with: contract.request_number
    fill_in 'Cliente', with: contract.customer
    fill_in 'Endereço', with: contract.address
    fill_in 'Contato', with: contract.contact
    fill_in 'Prazo', with: contract.deadline
    fill_in 'Equipamentos', with: contract.equipment
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
    expect(page).to have_content contract.equipment
    expect(page).to have_content contract.start_date
    expect(page).to have_content contract.end_date
    expect(page).to have_content contract.price
    expect(page).to have_content contract.discount

  end

end
