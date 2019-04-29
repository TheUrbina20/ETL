class RecibosDeComprasController < ApplicationController
  def index
    if current_user.admin?
      @recibos = ReciboDeCompra.using(:dwh_t).where(error: true)
    elsif current_user.hotel?
      @recibos = ReciboDeCompra.using(:dwh_t).where(sistema: 'H', error: true)
    elsif current_user.rrhh?
      @recibos = ReciboDeCompra.using(:dwh_t).where(sistema: 'RR', error: true)
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
    if @recibo_compra.update(recibo_de_compra_params)
      flash[:notice] = 'Actualizado'
      redirect_to recibos_de_compras_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def recibo_de_compra_params
    params.require(:recibo_de_compra).permit(:id_sistema, :sistema, :id_pedido_compra, :f_entrega)
  end

end
