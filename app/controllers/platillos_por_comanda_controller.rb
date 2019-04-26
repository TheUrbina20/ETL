class PlatillosPorComandaController < ApplicationController
  def index
    initialize_platillos_por_comanda
    @platillos_por_comanda = PlatilloPorComanda.using(:dwh_t).all
  end

  def initialize_platillos_por_comanda
    PlatilloPorComanda.using(:dwh_t).delete_all
    platillos_por_comanda = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Platillo_comanda']

    platillos_por_comanda.each do |platillo_por_comanda_r|

      platillo_por_comanda = PlatilloPorComanda.using(:dwh_t).new

      platillo_por_comanda.id = platillo_por_comanda_r[:Id]
      platillo_por_comanda.id_platillo = platillo_por_comanda_r[:id_platillo]
      platillo_por_comanda.id_comanda = platillo_por_comanda_r[:id_comanda]
      platillo_por_comanda.cantidad = platillo_por_comanda_r[:cantidad]
      platillo_por_comanda.save!
    end
  end
end
