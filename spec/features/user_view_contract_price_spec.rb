require 'rails_helper'

feature 'User view contract price' do
  scenario 'succesfully' do
    equipment = create(:equipment)
    rental_period = create(:rental_period, period: 15)
    price = create(:price, equipment: equipment, rental_period: rental_period,
                           amount: 100)


    visit root_path

    click_on 'Novo Contrato'

    fill_in 'Número do Contrato', with: '133512'
    fill_in 'Número do Pedido', with: '0932'
    fill_in 'Cliente', with: 'CampusCode'
    fill_in 'Endereço', with: 'Pamplona, 795'
    fill_in 'Contato', with: 'José da Silva'
    select  '15', :from => 'Prazo'

    check(equipment.name)

    fill_in 'Data de Início', with: '2016-08-01'
    fill_in 'Desconto', with: 5

    click_on 'Cadastrar Contrato'

    expect(page).to have_content '133512'
    expect(page).to have_content '0932'
    expect(page).to have_content 'CampusCode'
    expect(page).to have_content 'Pamplona, 795'
    expect(page).to have_content 'José da Silva'
    expect(page).to have_content '15'
    expect(page).to have_content equipment.name
    expect(page).to have_content '2016-08-01'
    expect(page).to have_content '2016-08-16'
    expect(page).to have_content '5'
    expect(page).to have_content 'R$ 100,00' #total value
  end
end
