class ReceiptsController < ApplicationController
  def create
    @receipt = Receipt.new(params.permit(:contract_id))

    if @receipt.valid?
      @receipt.save
      flash.now[:notice] = 'Recibo criado com sucesso.'
      redirect_to @receipt

    end

  end
end
