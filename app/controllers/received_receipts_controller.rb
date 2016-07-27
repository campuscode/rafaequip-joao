class ReceivedReceiptsController < ApplicationController
  before_action :valid_data, only: [:create]

  def create

      @received_receipt = @contract.build_received_receipt(params_received)
    if @received_receipt.save
      flash[:notice] = 'Recibo criado com sucesso.'
      redirect_to @received_receipt
    else
      flash[:error] = 'Erro, falta o nome do responsável'
      redirect_to @contract
    end
  end

  def show
    @received_receipt = ReceivedReceipt.find(params[:id])
  end

  private

  def valid_data
    @contract = Contract.find(params[:contract_id])
    if @contract.received_receipt
      flash.now[:error] = 'Só pode haver um recibo de devolução por contrato'
      render 'show'
    end
  end

  def params_received
    params.require(:received_receipt).permit(:responsible, :received_date)
  end
end
