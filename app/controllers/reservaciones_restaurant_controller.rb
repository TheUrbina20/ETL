class ReservacionesRestaurantController < ApplicationController
  def index
  end

  private

  def initialize_reservaciones
    ReservacionRestaurant.using(:dwh_t).delete_all

    reservaciones = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Reservacion']

    reservaciones.each do |reservacion_r|
      reservacion = ReservacionRestaurant.using(:dwh_t).new

      reservacion.id = reservacion_r[:Id]
      reservacion.f_reservacion = reservacion_r[:fecha_reservacion]
      reservacion.hora = reservacion_r[:hora]
      reservacion.id_cliente = reservacion_r[:id_cliente]
      reservacion.id_empleado = reservacion_r[:id_empleado]

    end
  end
end
