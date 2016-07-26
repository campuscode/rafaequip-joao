class CreateReceivedReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :received_receipts do |t|
      t.references :contract, foreign_key: true
      t.date :received_date
      t.string :responsible

      t.timestamps
    end
  end
end
