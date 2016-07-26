require 'rails_helper'


feature 'User view Equipment' do
  scenario 'succesfully' do
    equipment = create_list(:equipment, 5)

    visit equipment_index_path

    equipment.each do |e|
      expect(page).to have_content(e.code)
      expect(page).to have_link(e.name)
      expect(page).to have_content(e.serial_number)
      expect(page).to have_content(e.supplier)
      expect(page).to have_content(e.category)
      expect(page).to have_content(number_to_currency(e.price))
      expect(page).to have_content(e.status)
    end
  end

  scenario 'without equipment' do
    visit equipment_index_path
    expect(page).to have_content('Não há equipamentos cadastrados.')
  end
end
