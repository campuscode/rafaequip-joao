class ChangePriceFromPrice < ActiveRecord::Migration[5.0]
  def change
    rename_column :prices, :price, :amount
  end
end
