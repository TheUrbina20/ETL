class PedidosPorEmpleadoController < ApplicationController
  def index
    if current_user.admin?
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(error: true)
    elsif current_user.hotel?
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(sistema: 'H', error: true)
    elsif current_user.rrhh?
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(sistema: 'RR', error: true)
    else
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(sistema: 'R', error: true)
    end
  end

  def edit
    @pedido_empleado = PedidoPorEmpleado.using(:dwh_t).find(params[:id])
  end

  def update
    @pedido_empleado = PedidoPorEmpleado.using(:dwh_t).find(params[:id])
    if @pedido_empleado.update(pedidos_por_empleado_params)
      flash[:notice] = 'Actualizado'
      redirect_to pedidos_por_empleado_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def pedidos_por_empleado_params
    params.require(:pedido_por_empleado).permit(:id_sistema, :sistema, :f_peticion, :id_empleado)
  end
end
