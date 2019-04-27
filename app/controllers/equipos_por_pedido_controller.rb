class EquiposPorPedidoController < ApplicationController
  def index
    initialize_equipos_por_pedido
    @equipos_por_pedido = EquipoPorPedido.using(:dwh_t).all
  end

  private

  def initialize_equipos_por_pedido
    EquipoPorPedido.using(:dwh_t).delete_all
    equipos_por_pedido = EquipoPorPedido.using(:rrhh).all

    equipos_por_pedido.each do |equipo_r|
      equipo = EquipoPorPedido.using(:dwh_t).new()

      equipo.id = equipo_r.id
      equipo.id_pedido = equipo_r.id_pedido
      equipo.id_equipo = equipo_r.id_equipo
      equipo.save!
    end

    equipos_por_pedido = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_equipo_pedido']

    equipos_por_pedido.each do |equipo_r|
      equipo = EquipoPorPedido.using(:dwh_t).new()

      equipo.id = equipo_r.id
      equipo.id_pedido = equipo_r.id_pedido
      equipo.id_equipo = equipo_r.id_equipo
      equipo.save!
    end


  end
end
