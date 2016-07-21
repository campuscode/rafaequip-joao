class ChangeRentalPeriodFromRentalPeriod < ActiveRecord::Migration[5.0]
  def change
    rename_column :rental_periods, :rental_period, :period
  end
end
