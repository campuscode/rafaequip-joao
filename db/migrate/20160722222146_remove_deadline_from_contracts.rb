class RemoveDeadlineFromContracts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :deadline, :integer
  end
end
