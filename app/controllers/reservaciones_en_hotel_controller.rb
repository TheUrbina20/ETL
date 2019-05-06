class ReservacionesEnHotelController < ApplicationController
  def index

      @reservaciones = ReservacionEnHotel.using(:dwh_t).where(error: true)
  end

  def edit
    @reservacion = ReservacionEnHotel.using(:dwh_t).find(params[:id])
  end

  def destroy
    @reservacion = ReservacionEnHotel.using(:dwh_t).find(params[:id])
    if @reservacion.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to reservaciones_en_hotel_index_path
  end

  def update
    @reservacion = ReservacionEnHotel.using(:dwh_t).find(params[:id])
    if validate_attributes && @reservacion.update(reservacion_params)
      @reservacion.update_attributes(error: false)
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

  def validate_attributes
    valid_date?(params[:reservacion_en_hotel][:f_entrada]) && valid_date?(params[:reservacion_en_hotel][:f_salida]) && valid_date?(params[:reservacion_en_hotel][:f_reservacion]) && valid_status?(params[:reservacion_en_hotel][:estado])
  end

end
