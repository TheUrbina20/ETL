class FacturasHotelController < ApplicationController
  def index
    initialize_facturas_hotel
    @facturas = FacturaHotel.using(:dwh_t).all
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
      factura.sistema = 'H'
      factura.save!
    end

  end
end
