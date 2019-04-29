class FacturasRestauranteController < ApplicationController
  def index
    initialize_facturas
    @facturas = FacturaRestaurante.using(:dwh_t).all
  end

  def edit
    @factura_restaurante = FacturaRestaurante.using(:dwh_t).find(params[:id])
  end

  def update
    @factura_restaurante = FacturaRestaurante.using(:dwh_t).find(params[:id])
    if @factura_restaurante.update(factura_restaurante_params)
      flash[:notice] = 'Actualizado'
      redirect_to facturas_restaurante_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def factura_restaurante_params
    params.require(:factura_restaurante).permit(:id_sistema, :id_cliente, :fecha_emision, :tipo_pago, :sistema)
  end
  def initialize_facturas
    FacturaRestaurante.using(:dwh_t).delete_all


    facturas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Factura']

    factura = FacturaRestaurante.using(:dwh_t).new

    facturas.each do |factura_r|
      factura = FacturaRestaurante.using(:dwh_t).new

      factura.id_sistema = factura_r[:Id]
      factura.id_cliente =factura_r[:id_cliente]
      factura.fecha_emision = factura_r[:fecha_factura]
      factura.tipo_pago = factura_r[:id_tipo_pago]
      factura.sistema = 'R'
      factura.save!
    end

  end
end
