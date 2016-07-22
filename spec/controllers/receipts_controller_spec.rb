require 'rails_helper'

RSpec.describe ReceiptsController, type: :controller do
  describe 'Post create' do
    it 'post create receipt only once' do
      equipment_list = create_list(:equipment, 3)
      contract = create(:contract, equipment: equipment_list)
      Receipt.create(contract_id: contract.id, delivery_date: Time.zone.now)
      post :create, params: { 'contract_id' => contract.id }
      expect(flash[:error])
        .to eq('Só pode haver um recibo de entrega por contrato')
    end
  end
end
