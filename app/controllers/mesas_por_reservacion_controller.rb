class MesasPorReservacionController < ApplicationController
  def index
    initialize_mesas_por_reservacion
    @mesas_por_reservacion = MesaPorReservacion.using(:dwh_t).all
  end

  def initialize_mesas_por_reservacion
    MesaPorReservacion.using(:dwh_t).delete_all
    mesas_por_reservacion = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Reservacion_mesa']

    mesas_por_reservacion.each do |mesa_por_reservacion_r|
      mesa_por_reservacion = MesaPorReservacion.using(:dwh_t).new
      mesa_por_reservacion.id_reservacion = mesa_por_reservacion_r[:id_reservac]
      mesa_por_reservacion.id_mesa = mesa_por_reservacion_r[:id_mesa]
      mesa_por_reservacion.estado = mesa_por_reservacion_r[:estado]
      unless valid_name?(mesa_por_reservacion.estado)
        mesa_por_reservacion.error = true
      end
      mesa_por_reservacion.save!
    end
  end
end
