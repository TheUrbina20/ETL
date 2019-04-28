class DetallesDeFacturaHotelController < ApplicationController
  def index
    initialize_detalle_factura_restaurante
    @detalles_de_factura_hotel = DetalleDeFacturaHotel.using(:dwh_t).all
  end

  def initialize_detalle_factura_restaurante
    DetalleDeFacturaHotel.using(:dwh_t).delete_all

    detalles_de_factura_hotel = DetalleDeFacturaHotel.using(:restaurant).all
    detalles_de_factura = DetalleDeFacturaHotel.using(:dwh_t).new

    detalles_de_factura_hotel.each do |detalles_de_factura_r|
      detalles_de_factura = DetalleDeFacturaHotel.using(:dwh_t).new

      detalles_de_factura.id = detalles_de_factura_r.idDetalle
      detalles_de_factura.cantidad = detalles_de_factura_r.Cantidad
      detalles_de_factura.total = detalles_de_factura_r.Total
      detalles_de_factura.id_factura = detalles_de_factura_r.idFactura
      detalles_de_factura.id_servicio_hotel = detalles_de_factura_r.idServicioH
      detalles_de_factura.save!
    end
  end
end
