class ProposalsController < ApplicationController
  def new
    @proposal = Proposal.new
  end

  def index
    @proposals = Proposal.all.reverse
  end

  def create
    @proposal = Proposal.new(params.require(:proposal).permit(:name, :email, :phone, :description))
    if @proposal.valid?
      @proposal.save
      flash[:notice] = "Seu orçamento foi recebido com sucesso. Aguarde nosso contato."
      redirect_to @proposal
    else
      flash.now[:error] = 'Falha ao enviar orçamento'
      render 'new'
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end
end
