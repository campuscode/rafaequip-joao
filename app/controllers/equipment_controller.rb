class EquipmentController < ApplicationController
  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(params.require(:equipment)
      .permit(:code, :name, :serial_number, :supplier, :category, :price,
              :status))

    if @equipment.save
      flash[:notice] = 'Equipamento criado com sucesso.'
      redirect_to @equipment
    else
      flash.now[:error] = 'Erro ao cadastrar equipamento.'
      render 'new'
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def index
    @equipment = Equipment.all
    flash.now[:error] = 'Nenhum equipamento cadastrado.' if @equipment.empty?
  end
end
