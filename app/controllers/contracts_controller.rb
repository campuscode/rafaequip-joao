class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(params.require(:contract).permit(:number,
    :request_number, :customer, :address, :contact, :deadline, :equipment,
    :start_date, :end_date, :price, :discount))

    if @contract.save
      redirect_to @contract
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end
end
