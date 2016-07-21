class RemoveEquipmentFromContract < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :equipment, :string
  end
end
