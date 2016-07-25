class AddDeliveryDateToReceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :delivery_date, :datetime
  end
end
