class EquiposPorPedidoController < ApplicationController
  def index
    initialize_equipos_por_pedido
    if current_user.admin?
      @equipos_por_pedido = EquipoPorPedido.using(:dwh_t).all
    elsif current_user.hotel?
      @equipos_por_pedido = EquipoPorPedido.using(:dwh_t).where(sistema: 'H')
    elsif current_user.rrhh?
      @equipos_por_pedido = EquipoPorPedido.using(:dwh_t).where(sistema: 'RR')
    else
      @equipos_por_pedido = EquipoPorPedido.using(:dwh_t).where(sistema: 'R')
    end

  end

  private

  def initialize_equipos_por_pedido
    EquipoPorPedido.using(:dwh_t).delete_all
    equipos_por_pedido = EquipoPorPedido.using(:rrhh).where(error: true)
    equipo = EquipoPorPedido.using(:dwh_t).new

    equipos_por_pedido.each do |equipo_r|
      equipo = EquipoPorPedido.using(:dwh_t).new()

      equipo.id_sistema = equipo_r.id
      equipo.id_pedido = equipo_r.id_pedido
      equipo.id_equipo = equipo_r.id_equipo
      equipo.sistema = 'RR'
      equipo.save!
    end

    equipos_por_pedido = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_equipo_pedido']

    equipos_por_pedido.each do |equipo_r|
      equipo = EquipoPorPedido.using(:dwh_t).new

      equipo.id_sistema = equipo_r[:Id]
      equipo.id_pedido = equipo_r[:id_pedido]
      equipo.id_equipo = equipo_r[:id_equipo]
      equipo.sistema = 'R'
      equipo.save!
    end


  end
end
