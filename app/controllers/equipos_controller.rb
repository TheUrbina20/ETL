class EquiposController < ApplicationController
  def index
    initialize_equipos
    @equipos = Equipo.using(:dwh_t).all
  end

  private

  def initialize_equipos
    Equipo.using(:dwh_t).delete_all

    equipos = Equipo.using(:rrhh).all
    equipo = Equipo.using(:dwh_t).new

    equipos.each do |equipo_r|
      equipo = Equipo.using(:dwh_t).new

      equipo.id_sistema = equipo_r.id
      equipo.nombre = equipo_r.nombre
      equipo.modelo = equipo_r.modelo
      equipo.sistema = 'RH'
      equipo.save!
    end


    equipos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Equipo']

    equipos.each do |equipo_r|
      equipo = Equipo.using(:dwh_t).new()

      equipo.id_sistema = equipo_r[:Id]
      equipo.nombre = equipo_r[:nombre]
      equipo.sistema = 'R'
      equipo.save!
    end

    equipos = Equipo.using(:restaurant).all

    equipos.each do |equipo_r|
      equipo = Equipo.using(:dwh_t).new()

      equipo.id_sistema = equipo_r.idEquipo
      equipo.nombre = equipo_r.Nombre
      equipo.sistema = 'H'
      equipo.save!
    end
  end
end
