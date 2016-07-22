class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end
  def index
    @contracts = Contract.all
  end

  def create
    @contract = Contract.new(params_contract)
    if @contract.save

      flash[:notice] = 'Contrato criado com sucesso.'
      redirect_to @contract
    else
      flash.now[:error] = 'Erro ao cadastrar contrato.'
      render 'new'
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private

  def params_contract
    params
      .require(:contract).permit(:number, :request_number, :customer, :address,
                                 :contact, :deadline, :start_date,
                                 :end_date, :price, :discount,
                                 equipment_ids: [])
  end
end
