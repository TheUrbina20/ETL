class EquipoHabitacionesController < ApplicationController
    def index
      initialice_equiposh
      @equiposh = EquipoHabitacion.using(:dwh_t).all
    end

    private

    def initialice_equiposh
      EquipoHabitacion.using(:dwh_t).delete_all

      equipos = EquipoHabitacion.using(:restaurant).all
      equipo = EquipoHabitacion.using(:dwh_t).new

      equipos.each do |equipo_r|
        equipo = EquipoHabitacion.using(:dwh_t).new

        equipo.id = equipo_r.idEquipoH
        equipo.idEquipo = equipo_r.idEquipo
        equipo.idHabitacion = equipo_r.idHabitacion
        equipo.save!
      end
    end
end
