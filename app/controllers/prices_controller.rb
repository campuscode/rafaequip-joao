class PricesController < ApplicationController
  def index
    @prices = Price.all
    flash.now[:notice] = 'Não há preços cadastrados.' if @prices.empty?
  end
end
