require 'rails_helper'

feature 'User view list of proposals' do
  scenario 'successfully' do
    proposals = create_list :proposal, 5

    visit proposals_path

    proposals.each do |proposal|
      expect(page).to have_link proposal.name
      expect(page).to have_content proposal.email
      expect(page).to have_content(I18n.l(proposal.created_at, format: :short))
    end
  end
end
