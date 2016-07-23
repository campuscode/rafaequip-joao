class AddRentalPeriodsFkToContracts < ActiveRecord::Migration[5.0]
  def change
    add_reference :contracts, :rental_period, foreign_key: true
  end
end
