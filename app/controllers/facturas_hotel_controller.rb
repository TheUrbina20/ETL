class FacturasHotelController < ApplicationController
  def index

    @facturas = FacturaHotel.using(:dwh_t).where(error: true)
  end

  def edit
    @factura_hotel = FacturaHotel.using(:dwh_t).find(params[:id])
  end

  def destroy
    @factura_hotel = FacturaHotel.using(:dwh_t).find(params[:id])
    if @factura_hotel.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to facturas_hotel_index_path
  end

  def update
    @factura_hotel = FacturaHotel.using(:dwh_t).find(params[:id])
    if validate_attributes && @factura_hotel.update(factura_hotel_params)
      @factura_hotel.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to facturas_hotel_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def delete_with_errors_factura_hotel
    FacturaHotel.using(:dwh_t).where(error: true).delete_all
    redirect_to landing_page_index_path
  end 

  def factura_hotel_params
    params.require(:factura_hotel).permit(:id_sistema, :id_cliente, :total, :fecha_emision, :tipo_pago, :id_renta)
  end

  def validate_attributes
    valid_tipopago?(params[:factura_hotel][:tipo_pago]) && valid_date?(params[:factura_hotel][:fecha_emision]) && valid_price?(params[:factura_hotel][:total])
  end
end
