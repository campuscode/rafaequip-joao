class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
