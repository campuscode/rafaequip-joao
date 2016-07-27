class RemoveStatusFromContract < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :status, :string
  end
end
