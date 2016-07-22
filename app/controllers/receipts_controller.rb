class ReceiptsController < ApplicationController
  def create
    @receipt = Receipt.new(params.permit(:contract_id))

    if @receipt.valid?
      @receipt.save
      flash.now[:notice] = 'Recibo criado com sucesso.'
      redirect_to @receipt
    end
    def show
      @receipt = Receipt.find(params[:id])
    end

  end
end
