require 'rails_helper'

feature 'User list all equipment' do
  scenario 'successfully' do
    equipment = create(:equipment)

    visit root_path

    click_on 'Listar Equipamentos'

    expect(page).to have_content equipment.code
    expect(page).to have_content equipment.name
    expect(page).to have_content equipment.status
    expect(page).to have_content equipment.price
  end

  scenario 'fail' do
    visit root_path

    click_on 'Listar Equipamento'
    expect(page).to have_content 'Nenhum equipamento cadastrado.'
  end
end
