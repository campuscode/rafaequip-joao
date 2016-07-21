class CreateRentalPeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :rental_periods do |t|
      t.integer :rental_period

      t.timestamps
    end
  end
end
