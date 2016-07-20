class AddCodeToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment, :code, :string
  end
end
