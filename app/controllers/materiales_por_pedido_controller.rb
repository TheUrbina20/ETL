class MaterialesPorPedidoController < ApplicationController
  def index
    if current_user.admin?
      @materiales_por_pedido = MaterialPorPedido.using(:dwh_t).where(error: true)
    elsif current_user.hotel?
      @materiales_por_pedido = MaterialPorPedido.using(:dwh_t).where(sistema: 'H', error: true)
    elsif current_user.rrhh?
      @materiales_por_pedido = MaterialPorPedido.using(:dwh_t).where(sistema: 'RR', error: true)
    else
      @materiales_por_pedido = MaterialPorPedido.using(:dwh_t).where(sistema: 'R', error: true)
    end
  end

  def edit
    @material_por_pedido = MaterialPorPedido.using(:dwh_t).find(params[:id])
  end

  def update
    @material_por_pedido = MaterialPorPedido.using(:dwh_t).find(params[:id])
    if @material_por_pedido.update(material_por_pedido_params)
      flash[:notice] = 'Actuaizado'
      redirect_to materiales_por_pedido_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def material_por_pedido_params
    params.require(:material_por_pedido).permit(:id_sistema, :sistema, :id_material, :id_pedido, :cantidad)
  end
end
