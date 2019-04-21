class CreateClientesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :estado
      t.string :correo
      t.string :telefono
    end
  end
end
