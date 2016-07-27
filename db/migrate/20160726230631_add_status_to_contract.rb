class AddStatusToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :status, :boolean
  end
end
