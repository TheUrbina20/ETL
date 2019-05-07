class FacturasRestauranteController < ApplicationController
  def index

    @facturas = FacturaRestaurante.using(:dwh_t).where(error: true)
  end

  def edit
    @factura_restaurante = FacturaRestaurante.using(:dwh_t).find(params[:id])
  end


  def destroy
    @factura_restaurante = FacturaRestaurante.using(:dwh_t).find(params[:id])
    if @factura_restaurante.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to facturas_restaurante_index_path
  end

  def update
    @factura_restaurante = FacturaRestaurante.using(:dwh_t).find(params[:id])
    if validate_attributes && @factura_restaurante.update(factura_restaurante_params)
      @factura_restaurante.update_attributes(error: false)
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

  def validate_attributes
    valid_date?(params[:factura_restaurante][:fecha_emision]) && valid_price?(params[:factura_restaurante][:total])
  end
end
