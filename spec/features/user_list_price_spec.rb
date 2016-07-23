require 'rails_helper'

feature 'User list all prices' do
  scenario 'successfully One equipment, two rental period' do
    equipment = create(:equipment)
    rental_period1, rental_period2 = create_list(:rental_period, 2)
    price_1 = create(:price, equipment: equipment,
                             rental_period: rental_period1)
    price_2 = create(:price, equipment: equipment,
                             rental_period: rental_period2)

    visit root_path

    click_on 'Listar Preços'

    expect(page).to have_content(equipment.name, count: 2)
    expect(page).to have_selector("td class='periodo'")
    expect(page).to have_content(rental_period2.description)
    expect(page).to have_content price_1.amount
    expect(page).to have_content price_2.amount
  end

  scenario 'successfully Two equipment, one rental period' do
    equipment1, equipment2 = create_list(:equipment, 2)
    rental_period = create(:rental_period)
    price_1 = create(:price, equipment: equipment1,
                             rental_period: rental_period)
    price_2 = create(:price, equipment: equipment2,
                             rental_period: rental_period)

    visit root_path

    click_on 'Listar Preços'

    expect(page).to have_content(equipment1.name)
    expect(page).to have_content(equipment2.name)
    expect(page).to have_content(rental_period.period, count: 2)
    expect(page).to have_content(price_1.amount)
    expect(page).to have_content(price_2.amount)
  end

  scenario 'fail' do
    visit root_path

    click_on 'Listar Preços'
    expect(page).to have_content 'Não há preços cadastrados.'
  end
end
