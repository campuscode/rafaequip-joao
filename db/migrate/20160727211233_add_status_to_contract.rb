class AddStatusToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :status, :integer, default: 0
  end
end
