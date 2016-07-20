require 'rails_helper'

feature 'User create equipment' do
  scenario 'successfully' do
    equipment = Equipment.new(code: 'Fur_01', name: 'Furadeira de alto impacto',
                              serial_number: '12345',
                              supplier: 'Bosh', category: 'furadeira',
                              price: 2500, status: 'Alugado')

    visit root_path

    click_on 'Novo Equipamento'

    fill_in 'Código', with: equipment.code
    fill_in 'Nome', with: equipment.name
    fill_in 'Número de Série', with: equipment.serial_number
    fill_in 'Fornecedor', with: equipment.supplier
    fill_in 'Categoria', with: equipment.category
    fill_in 'Preço', with: equipment.price
    fill_in 'Status', with: equipment.status

    click_on 'Cadastrar Equipamento'

    expect(page).to have_content equipment.code
    expect(page).to have_content equipment.name
    expect(page).to have_content equipment.serial_number
    expect(page).to have_content equipment.supplier
    expect(page).to have_content equipment.category
    expect(page).to have_content equipment.price
    expect(page).to have_content equipment.status
  end

  scenario 'Fail' do
    visit root_path

    click_on 'Novo Equipamento'

    click_on 'Cadastrar Equipamento'

    expect(page).to have_content 'Erro ao cadastrar equipamento'
  end
end
