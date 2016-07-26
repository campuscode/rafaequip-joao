class ReceivedReceiptsController < ApplicationController
  before_action :before_create, only: [:create]

  def create
    if @contract.received_receipt
      flash.now[:error] = 'Só pode haver um recibo de entrega por contrato'
      render 'show'
    else
      @received_receipt = @contract.create_received_receipt(params_received)
      flash.now[:notice] = 'Recibo criado com sucesso.'
      redirect_to @received_receipt
    end
  end

  def show
    @received_receipt = ReceivedReceipt.find(params[:id])
  end

  private

  def before_create
    @contract = Contract.find(params[:contract_id])
  end

  def params_received
    params.require(:received_receipt).permit(:responsible, :received_date)
  end
end
