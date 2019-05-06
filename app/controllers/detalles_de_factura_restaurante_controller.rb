class DetallesDeFacturaRestauranteController < ApplicationController
  def index

    @detalles_de_factura_restaurante = DetalleDeFacturaRestaurante.using(:dwh_t).where(error: true)
  end

  def edit
    @detalle_de_factura_restaurante = DetalleDeFacturaRestaurante.using(:dwh_t).find(params[:id])
  end

  def destroy
    @detalle_de_factura_restaurante = DetalleDeFacturaRestaurante.using(:dwh_t).find(params[:id])
    if @detalle_de_factura_restaurante.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to detalles_de_factura_restaurante_index_path
  end

  def update
    @detalle_de_factura_restaurante = DetalleDeFacturaRestaurante.using(:dwh_t).find(params[:id])
    if validate_attributes && @detalle_de_factura_restaurante.update(detalle_de_factura_params)
      @detalle_de_factura_restaurante.update_attributes(error: false)
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

  def validate_attributes
    valid_date?(params[:detalle_de_factura_restaurante][:fecha_emision]) && valid_price?(params[:detalle_de_factura_restaurante][:total])
  end

end
