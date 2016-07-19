require 'rails_helper'

feature "Visitor ask Proposal" do
  scenario "succesfully" do

    visit new_proposal_path

    fill_in "Nome", with: "Odair"
    fill_in "Email", with: "odair@gmail.com"
    fill_in "Telefone", with: "1234567"
    fill_in "Descrição", with: "Solicito orçamento para betoneira"

    click_on "Solicitar orçamento"

    expect(page).to have_content("Seu orçamento foi recebido com sucesso. Aguarde nosso contato.")
    expect(page).to have_content "Odair"
    expect(page).to have_content "odair@gmail.com"
    expect(page).to have_content "1234567"
    expect(page).to have_content "Solicito orçamento para betoneira"
  end
  scenario 'with valid data' do

    visit new_proposal_path

    click_on 'Solicitar orçamento'

    expect(page).to have_content 'Falha ao enviar orçamento'

  end

end
