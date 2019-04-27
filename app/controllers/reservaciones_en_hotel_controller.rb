class ReservacionesEnHotelController < ApplicationController
    def index
        initialize_reservaciones
        @reservaciones = ReservacionEnHotel.using(:dwh_t).all
    end

  private

  def initialize_reservaciones
    ReservacionEnHotel.using(:dwh_t).delete_all
    reservaciones = ReservacionEnHotel.using(:restaurant).all

    reservacion = ReservacionEnHotel.using(:dwh_t).new()

    reservaciones.each do |reservacion_r|
        reservacion = ReservacionEnHotel.using(:dwh_t).new()
        reservacion.id = reservacion_r.id
        reservacion.FechaIn = reservacion_r.FechaIn
        reservacion.FechaOut = reservacion_r.FechaOut
        reservacion.FechaReserv = reservacion_r.FechaReserv
        reservacion.Estado = reservacion_r.Estado
        reservacion.idCliente = reservacion_r.idCliente
        reservacion.idEmpleado = reservacion_r.idEmpleado
        reservacion.save!
    end
  end
end
