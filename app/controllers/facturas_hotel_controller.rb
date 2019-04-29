class FacturasHotelController < ApplicationController
  def index
    initialize_facturas_hotel
    @facturas = FacturaHotel.using(:dwh_t).all
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

  def initialize_facturas_hotel
    FacturaHotel.using(:dwh_t).delete_all
    facturas = FacturaHotel.using(:restaurant).all
    factura = FacturaHotel.using(:dwh_t).new

    facturas.each do |factura_r|
      factura = FacturaHotel.using(:dwh_t).new

      factura.id_sistema = factura_r.id
      factura.id_cliente = factura_r.idCliente
      factura.id_empleado = factura_r.idEmpleado
      factura.total = factura_r.Total
      factura.tipo_pago = factura_r.Tipopago
      factura.id_renta = factura_r.idRenta

      unless valid_price?(factura.total)
        factura.error = true
      end
      factura.save!
    end

  end
end
