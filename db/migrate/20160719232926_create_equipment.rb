class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :serial_number
      t.string :supplier
      t.string :category
      t.float :price
      t.string :status

      t.timestamps
    end
  end
end
