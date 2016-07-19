class AddDiscountToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :discount, :integer
  end
end
