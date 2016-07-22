class RemoveDeliveryDateFromReceipt < ActiveRecord::Migration[5.0]
  def change
    remove_column :receipts, :delivery_date, :string
  end
end
