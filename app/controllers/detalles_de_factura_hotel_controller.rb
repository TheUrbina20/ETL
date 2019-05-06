class DetallesDeFacturaHotelController < ApplicationController
  def index
    @detalles_de_factura_hotel = DetalleDeFacturaHotel.using(:dwh_t).where(error: true)
  end

  def edit
    @detalle_de_factura_hotel = DetalleDeFacturaHotel.using(:dwh_t).find(params[:id])
  end

  def destroy
    @detalle_de_factura_hotel = DetalleDeFacturaHotel.using(:dwh_t).find(params[:id])
    if @asistencias.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to detalles_de_factura_hotel_index_path
  end

  def update
    @detalle_de_factura_hotel = DetalleDeFacturaHotel.using(:dwh_t).find(params[:id])
    if validate_attributes && @detalle_de_factura_hotel.update(detalle_de_factura_hotel_params)
      @detalle_de_factura_hotel.update_attributes(error: false)
      flash[:notice] = 'Atualizado'
      redirect_to detalles_de_factura_hotel_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def detalle_de_factura_hotel_params
    params.require(:detalle_de_factura_hotel).permit(:id_factura, :cantidad, :id_servicio_hotel, :total)
  end

  def validate_attributes
    valid_number?(params[:detalle_de_factura_hotel][:cantidad]) && valid_price?(params[:detalle_de_factura_hotel][:total])
  end

end
