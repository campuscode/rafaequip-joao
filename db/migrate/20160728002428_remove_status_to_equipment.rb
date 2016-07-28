class RemoveStatusToEquipment < ActiveRecord::Migration[5.0]
  def change
    remove_column :equipment, :status, :string
  end
end
