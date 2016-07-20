class EquipmentController < ApplicationController
  def index
    @equipment = Equipment.all
    flash.now[:notice] = 'Não há equipamentos cadastrados.' if @equipment.empty?
  end
end
