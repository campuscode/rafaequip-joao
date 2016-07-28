class AddStatusToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment, :status, :integer, default: 0
  end
end
