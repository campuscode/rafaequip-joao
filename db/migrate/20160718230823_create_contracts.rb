class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.integer :number
      t.integer :request_number
      t.string :customer
      t.string :address
      t.string :contact
      t.integer :deadline
      t.text :equipment
      t.date :start_date
      t.date :end_date
      t.float :price

      t.timestamps
    end
  end
end
