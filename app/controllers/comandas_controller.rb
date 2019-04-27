class ComandasController < ApplicationController
  def index
    initialize_comandas
    @comandas = Comanda.using(:dwh_t).all
  end

  def initialize_comandas
    Comanda.using(:dwh_t).delete_all
    comandas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Comanda']

    comandas.each do |comanda_r|
      comanda = Comanda.using(:dwh_t).new
      comanda.id = comanda_r[:Id]
      comanda.id_reservacion = comanda_r[:id_reserva_m]
      comanda.id_empleado = comanda_r[:id_empleado]
      comanda.fecha = comanda_r[:fecha]
      comanda.hora_reservacion = comanda_r[:hora]
      comanda.save!
    end
  end
end
