class PedidosPorEmpleadoController < ApplicationController
  def index
    if current_user.admin?
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(error: true)
    elsif current_user.hotel?
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(sistema: 'H', error: true)
    elsif current_user.rrhh?
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(sistema: 'RH', error: true)
    else
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(sistema: 'R', error: true)
    end
  end

  def destroy
    @pedido_empleado = PedidoPorEmpleado.using(:dwh_t).find(params[:id])
    if @pedido_empleado.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to pedidos_por_empleado_index_path
  end

  def edit
    @pedido_empleado = PedidoPorEmpleado.using(:dwh_t).find(params[:id])
  end

  def update
    @pedido_empleado = PedidoPorEmpleado.using(:dwh_t).find(params[:id])
    if validate_attributes && @pedido_empleado.update(pedidos_por_empleado_params)
      @pedido_empleado.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to pedidos_por_empleado_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def delete_with_errors_pedidos_por_empleado
    if current_user.hotel?
      PedidoPorEmpleado.using(:dwh_t).where(sistema: 'H', error: true).delete_all
    elsif current_user.rrhh?
      PedidoPorEmpleado.using(:dwh_t).where(sistema: 'RH', error: true).delete_all
    else
      PedidoPorEmpleado.using(:dwh_t).where(sistema: 'R', error: true).delete_all
    end
    redirect_to landing_page_index_path
  end

  def pedidos_por_empleado_params
    params.require(:pedido_por_empleado).permit(:id_sistema, :sistema, :f_peticion, :id_empleado)
  end

  def validate_attributes
    valid_date?(params[:pedido_por_empleado][:f_peticion])
  end
end
