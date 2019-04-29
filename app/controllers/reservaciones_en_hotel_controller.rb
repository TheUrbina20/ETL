class ReservacionesEnHotelController < ApplicationController
  def index
      initialize_reservaciones
      @reservaciones = ReservacionEnHotel.using(:dwh_t).where(error: true)
  end

  def edit
    @reservacion = ReservacionEnHotel.using(:dwh_t).find(params[:id])
  end

  def update
    @reservacion = ReservacionEnHotel.using(:dwh_t).find(params[:id])
    if @reservacion.update(reservacion_params)
      flash[:notice] = 'Actualizado'
      redirect_to reservaciones_en_hotel_index_path
    else
      flash.now[:alert] = 'Error actuaizando'
      render 'edit'
    end
  end

  def reservacion_params
    params.require(:reservacion_en_hotel).permit(:f_entrada, :f_salida, :f_reservacion, :estado, :id_cliente, :id_empleado)
  end
  private

  def initialize_reservaciones
    ReservacionEnHotel.using(:dwh_t).delete_all
    reservaciones = ReservacionEnHotel.using(:restaurant).all

    reservacion = ReservacionEnHotel.using(:dwh_t).new()

    reservaciones.each do |reservacion_r|
        reservacion = ReservacionEnHotel.using(:dwh_t).new()
        reservacion.id = reservacion_r.id
        reservacion.f_entrada = reservacion_r.FechaIn
        reservacion.f_salida = reservacion_r.FechaOut
        reservacion.f_reservacion = reservacion_r.FechaReserv
        reservacion.estado = reservacion_r.Estado
        reservacion.id_cliente = reservacion_r.idCliente
        reservacion.id_empleado = reservacion_r.idEmpleado
        unless valid_date?(reservacion.f_entrada)
          reservacion.error = true
        end
        unless valid_date?(reservacion.f_salida)
          reservacion.error = true
        end
        unless valid_name?(reservacion.estado)
          reservacion.error = true
        end
        unless valid_date?(reservacion.f_reservacion)
          reservacion.error = true
        end
        reservacion.save!
    end
  end
end
