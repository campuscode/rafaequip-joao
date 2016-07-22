class ReceiptsController < ApplicationController
  before_action :before_create, only: [:create]

  def create
    if @contract.receipt
      flash.now[:error] = 'Só pode haver um recibo de entrega por contrato'
      render 'show'
    elsif @receipt.valid?
      @receipt.save
      flash.now[:notice] = 'Recibo criado com sucesso.'
      redirect_to @receipt
    end
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  private

  def before_create
    @receipt = Receipt.new(params.permit(:contract_id))
    @contract = Contract.find(@receipt.contract.id)
  end
end
