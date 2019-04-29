class FacturasHotelController < ApplicationController
  def index

    @facturas = FacturaHotel.using(:dwh_t).where(error: true)
  end

  def edit
    @factura_hotel = FacturaHotel.using(:dwh_t).find(params[:id])
  end

  def update
    @factura_hotel = FacturaHotel.using(:dwh_t).find(params[:id])
    if @factura_hotel.update(factura_hotel_params)
      flash[:notice] = 'Actualizado'
      redirect_to facturas_hotel_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def factura_hotel_params
    params.require(:factura_hotel).permit(:id_sistema, :id_cliente, :total, :fecha_emision, :tipo_pago, :id_renta)
  end
end
