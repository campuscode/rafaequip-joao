class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.float :price
      t.references :equipment, foreign_key: true
      t.references :rental_period, foreign_key: true

      t.timestamps
    end
  end
end
