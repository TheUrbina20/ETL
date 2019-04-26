class ReservacionesController < ApplicationController
    def index
        initialize_reservaciones
        @reservaciones = Reservacion.using(:dwh_t).all
    end

  private

  def initialize_reservaciones
    Reservacion.using(:dwh_t).delete_all

    reservaciones = Reservacion.using(:restaurant).all
    reservacion = Reservacion.using(:dwh_t).new()


    reservaciones.each do |r|
        reservacion = Reservacion.using(:dwh_t).new()
        reservacion.idReservacion = r.idReservacion
        reservacion.FechaIn = r.FechaIn
        reservacion.FechaOut = r.FechaOut
        reservacion.FechaReserv = r.FechaReserv
        reservacion.Estado = r.Estado
        reservacion.idCliente = r.idCliente
        reservacion.idEmpleado = r.idEmpleado
        reservacion.save!
    end
  end
end
