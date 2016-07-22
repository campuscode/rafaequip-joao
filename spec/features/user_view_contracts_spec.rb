require 'rails_helper'
feature 'User view Contracts' do
  scenario 'succesfully' do
    contracts = create_list(:contract, 5)

    visit contracts_path
    contracts.each do |contract|
      expect(page).to have_link(contract.number)
      expect(page).to have_content(contract.customer)
      expect(page).to have_content(contract.request_number)
    end

  end
end
