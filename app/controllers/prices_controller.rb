class PricesController < ApplicationController
  def index
    @prices = Price.all

    flash.now[:error] = 'Não há preços cadastrados.' if @prices.empty?
  end
end
