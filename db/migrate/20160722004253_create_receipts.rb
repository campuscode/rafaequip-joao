class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.references :contract, foreign_key: true
      t.date :delivery_date

      t.timestamps
    end
  end
end
