require 'rails_helper'

feature 'User list all prices' do
  scenario 'successfully' do
    price = create(:price)
    equipment = price.equipment
    rental_period = price.rental_period

    visit root_path

    click_on 'Listar Preços'

    expect(page).to have_content equipment.name
    expect(page).to have_content rental_period.period
    expect(page).to have_content price.amount
  end

  scenario 'fail' do
    visit root_path

    click_on 'Listar Preços'
    expect(page).to have_content 'Não há preços cadastrados.'
  end
end
