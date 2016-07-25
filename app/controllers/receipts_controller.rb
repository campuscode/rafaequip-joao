class ReceiptsController < ApplicationController
  before_action :before_create, only: [:create]

  def create
    if @contract.receipt
      flash.now[:error] = 'Só pode haver um recibo de entrega por contrato'
      render 'show'
    else
      @receipt = @contract.create_receipt(delivery_date: Time.zone.now)
      flash.now[:notice] = 'Recibo criado com sucesso.'
      redirect_to @receipt
    end
  end

  def show
    @receipt = Receipt.find(params[:id])
    render layout: 'receipt'
  end

  private

  def before_create
    @contract = Contract.find(params[:contract_id])
  end
end
