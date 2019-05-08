class EquiposPorPedidoController < ApplicationController
  def index
    if current_user.admin?
      @equipos_por_pedido = EquipoPorPedido.using(:dwh_t).all
    elsif current_user.hotel?
      @equipos_por_pedido = EquipoPorPedido.using(:dwh_t).where(sistema: 'H')
    elsif current_user.rrhh?
      @equipos_por_pedido = EquipoPorPedido.using(:dwh_t).where(sistema: 'RH')
    else
      @equipos_por_pedido = EquipoPorPedido.using(:dwh_t).where(sistema: 'R')
    end
  end
end
