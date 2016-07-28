require 'rails_helper'

feature 'User does not view Equipment' do
  scenario 'succesfully' do
    equipment = create_list(:equipment, 2)
    equipment.last.rented!

    visit new_contract_path

    expect(page).not_to have_content(equipment.last.name)
    expect(page).to have_content(equipment.first.name)
  end

  scenario 'contract rented equipment' do
    equipment = create_list(:equipment, 2)
    create(:rental_period, period: 15)
    create(:contract, equipment: [equipment.last])

    visit new_contract_path

    expect(page).not_to have_content(equipment.last.name)
    expect(page).to have_content(equipment.first.name)
  end

  scenario 'finish contract and release equipment' do
    equipment = create_list(:equipment, 2)
    create(:rental_period, period: 15)
    contract = create(:contract, equipment: [equipment.last])

    contract.closed!

    visit new_contract_path

    expect(page).to have_content(equipment.last.name)
    expect(page).to have_content(equipment.first.name)
  end
end
