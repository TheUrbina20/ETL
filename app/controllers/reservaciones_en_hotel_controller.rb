class ReservacionesEnHotelController < ApplicationController
  def index

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

end
