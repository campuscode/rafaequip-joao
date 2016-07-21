class EquipmentController < ApplicationController
  def index
    @equipment = Equipment.all
    flash.now[:notice] = 'Não há equipamentos cadastrados.' if @equipment.empty?
  end

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
      flash.now[:error] = 'Não há equipamentos cadastrados.'
      render 'new'
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end
end
