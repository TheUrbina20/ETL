class DetallesDeFacturaRestauranteController < ApplicationController
  def index
    initialize_detalle_factura_restaurante
    @detalles_de_factura_restaurante = DetalleDeFacturaRestaurante.using(:dwh_t).where(error: true)
  end

  def edit
    @detalle_de_factura_restaurante = DetalleDeFacturaRestaurante.using(:dwh_t).find(params[:id])
  end

  def update
    @detalle_de_factura_restaurante = DetalleDeFacturaRestaurante.using(:dwh_t).find(params[:id])
    if @detalle_de_factura_restaurante.update(detalle_de_factura_params)
      flash[:notice] = 'Actualizado'
      redirect_to detalles_de_factura_restaurante_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def detalle_de_factura_params
    params.require(:detalle_de_factura_restaurante).permit(:id_factura, :id_comanda, :fecha_emision, :total)
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
      unless valid_date?(detalles_de_factura.fecha_emision)
        detalles_de_factura.error = true
      end
      unless valid_price?(detalles_de_factura)
        detalles_de_factura.error = true
      end
      detalles_de_factura.save!
    end
  end
end
