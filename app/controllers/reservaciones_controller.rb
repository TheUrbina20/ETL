class ReservacionesController < ApplicationController
    def index
        initialize_reservaciones
        @reservaciones = Reservacion.using(:dwh_t).where(error: true)
    end
    def edit
      @reservaciones = Reservacion.using(:dwh_t).find(params[:id])
    end

    def update
      @reservaciones = Reservacion.using(:dwh_t).find(params[:id])

      if @reservaciones.update(reservaciones_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to reservaciones_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def reservaciones_params
      params.require(:reservacion).permit(:id, :idReservacion, :FechaIn, :FechaOut, :FechaReserv, :Estado, :idCliente, :idEmpleado)
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
        unless valid_date?(reservacion.FechaIn)
          reservacion.error = true
        end
        unless valid_date?(reservacion.FechaOut)
          reservacion.error = true
        end
        unless valid_date?(reservacion.FechaReserv)
          reservacion.error = true
        end
        unless valid_name?(reservacion.Estado)
          reservacion.error = true
        end
        reservacion.save!
    end
  end
end
