class AddCnpjToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :cnpj, :string
  end
end
