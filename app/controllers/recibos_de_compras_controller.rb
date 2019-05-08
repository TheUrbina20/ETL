class RecibosDeComprasController < ApplicationController
  def index
    if current_user.admin?
      @recibos = ReciboDeCompra.using(:dwh_t).where(error: true)
    elsif current_user.hotel?
      @recibos = ReciboDeCompra.using(:dwh_t).where(sistema: 'H', error: true)
    elsif current_user.rrhh?
      @recibos = ReciboDeCompra.using(:dwh_t).where(sistema: 'RH', error: true)
    else
      @recibos = ReciboDeCompra.using(:dwh_t).where(sistema: 'R', error: true)
    end
  end

  def destroy
    @recibo_compra = ReciboDeCompra.using(:dwh_t).find(params[:id])
    if @recibo_compra.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to recibos_de_compras_path
  end

  def edit
    @recibo_compra = ReciboDeCompra.using(:dwh_t).find(params[:id])
  end

  def update
    @recibo_compra = ReciboDeCompra.using(:dwh_t).find(params[:id])
    if validate_attributes && @recibo_compra.update(recibo_de_compra_params)
      @recibo_compra.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to recibos_de_compras_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def delete_with_errors_recibos_de_compra
    if current_user.hotel?
      ReciboDeCompra.using(:dwh_t).where(sistema: 'H', error: true).delete_all
    elsif current_user.rrhh?
      ReciboDeCompra.using(:dwh_t).where(sistema: 'RH', error: true).delete_all
    else
      ReciboDeCompra.using(:dwh_t).where(sistema: 'R', error: true).delete_all
    end
    redirect_to landing_page_index_path
  end

  def recibo_de_compra_params
    params.require(:recibo_de_compra).permit(:id_sistema, :sistema, :id_pedido_compra, :f_entrega)
  end

  def validate_attributes
    valid_date?(params[:recibo_de_compra][:f_entrega])
  end

end
