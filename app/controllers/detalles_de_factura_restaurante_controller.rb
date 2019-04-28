class DetallesDeFacturaRestauranteController < ApplicationController
  def index
    initialize_detalle_factura_restaurante
    @detalles_de_factura_restaurante = DetalleDeFacturaRestaurante.using(:dwh_t).all
  end

  def initialize_detalle_factura_restaurante
    DetalleDeFacturaRestaurante.using(:dwh_t).delete_all

    detalles_de_factura = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Detalle_factura']

    detalles_de_factura.each do |detalles_de_factura_r|
      detalles_de_factura = DetalleDeFacturaRestaurante.using(:dwh_t).new

      detalles_de_factura.id = detalles_de_factura_r[:Id]
      detalles_de_factura.id_factura = detalles_de_factura_r[:id_factura]
      detalles_de_factura.id_comanda = detalles_de_factura_r[:id_comanda]
      detalles_de_factura.fecha_emision = detalles_de_factura_r[:fecha]
      detalles_de_factura.total = detalles_de_factura_r[:total]
      detalles_de_factura.save!
    end
  end
end
