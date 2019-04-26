class DmantenimientoEquiposController < ApplicationController
    def index
        initialize_mantenimientoe
        @mantenimientoe = DmantenimientoEquipo.using(:dwh_t).all
    end

  private

  def initialize_mantenimientoe
    DmantenimientoEquipo.using(:dwh_t).delete_all

    mantenimientos = DmantenimientoEquipo.using(:restaurant).all
    mantenimiento = DmantenimientoEquipo.using(:dwh_t).new()


    mantenimientos.each do |ma|
      mantenimiento = DmantenimientoEquipo.using(:dwh_t).new()
      mantenimiento.idDetalle = ma.idDetalle	
      mantenimiento.FechaInicio = ma.FechaInicio	
      mantenimiento.FechaTermino = ma.FechaTermino
      mantenimiento.idEquipoH = ma.idEquipoH
      mantenimiento.idMantenimientoE = ma.idMantenimientoE
      mantenimiento.idEmpleado = ma.idEmpleado
      mantenimiento.save!
    end
  end
end
