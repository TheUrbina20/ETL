class PedidosPorEmpleadoController < ApplicationController
  def index
    initialize_pedidos_por_empleados
    if current_user.admin?
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).all
    elsif current_user.hotel?
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(sistema: 'H')
    elsif current_user.rrhh?
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(sistema: 'RR')
    else
      @ordenes_por_empleados = PedidoPorEmpleado.using(:dwh_t).where(sistema: 'R')
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


  def initialize_pedidos_por_empleados
    PedidoPorEmpleado.using(:dwh_t).delete_all

    pedidos = PedidoPorEmpleado.using(:rrhh).all
    pedido = PedidoPorEmpleado.using(:dwh_t).new

    pedidos.each do |pedido_r|
      pedido = PedidoPorEmpleado.using(:dwh_t).new

      pedido.id_sistema = pedido_r.id
      pedido.id_empleado = pedido_r.id_empleado
      pedido.f_peticion = pedido_r.f_peticion
      pedido.sistema = 'RR'
      pedido.save!
    end

    pedidos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Pedido_rm']

    pedidos.each do |pedido_r|
      pedido = PedidoPorEmpleado.using(:dwh_t).new

      pedido.id_sistema = pedido_r[:Id]
      pedido.id_empleado = pedido_r[:id_empleado]
      pedido.f_peticion = pedido_r[:fecha]
      pedido.sistema = 'R'
      pedido.save!
    end

    pedidos = PedidoPorEmpleado.using(:restaurant).all

    pedidos.each do |pedido_r|
      pedido = PedidoPorEmpleado.using(:dwh_t).new

      pedido.id_sistema = pedido_r.idPedido
      pedido.id_empleado = pedido_r.id_empleado
      pedido.f_peticion = pedido_r.Fecha
      pedido.sistema = 'H'
      pedido.save!
    end

  end
end
