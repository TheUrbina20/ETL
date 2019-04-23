class EquiposController < ApplicationController
  def index
    initialice_equipos
    @equipos = Equipo.using(:dwh_t).all
  end

  private

  def initialice_equipos
    Equipo.using(:dwh_t).delete_all

    equipos = Equipo.using(:rrhh).all

    equipos.each do |equipo_r|
      equipo = Equipo.using(:dwh_t).new()

      equipo.id = equipo_r.id
      equipo.nombre = equipo_r.nombre
      equipo.modelo = equipo_r.modelo
      equipo.save!
    end
  end
end
