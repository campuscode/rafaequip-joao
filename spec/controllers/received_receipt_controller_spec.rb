require 'rails_helper'

RSpec.describe ReceivedReceiptsController, type: :controller do
  describe 'Post create' do
    it 'post create received receipt only once' do
      equipment_list = create_list(:equipment, 3)
      contract = create(:contract, equipment: equipment_list)
      Receipt.create(contract_id: contract.id, delivery_date: Time.zone.now)
      contract.create_received_receipt(responsible: 'Temer')
      post :create, params: { 'contract_id' => contract.id }
      expect(flash[:error])
        .to eq('Só pode haver um recibo de devolução por contrato')
    end
  end
end
