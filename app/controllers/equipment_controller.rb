class EquipmentController < ApplicationController

  def index
    @equipment = Equipment.all
    if @equipment.empty?
      flash.now[:notice] = "Não há equipamentos cadastrados."
    end
  end

end
