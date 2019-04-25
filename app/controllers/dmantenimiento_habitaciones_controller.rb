class DmantenimientoHabitacionesController < ApplicationController
    def index
        initialize_mantenimientoh
        @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).all
    end

  private

  def initialize_mantenimientoh
    DmantenimientoHabitacion.using(:dwh_t).delete_all

    mantenimientos = DmantenimientoHabitacion.using(:restaurant).all
    mantenimiento = DmantenimientoHabitacion.using(:dwh_t).new()


    mantenimientos.each do |ma|
      mantenimiento = DmantenimientoHabitacion.using(:dwh_t).new()
      mantenimiento.idDetalle = ma.idDetalle	
      mantenimiento.Descripcion = ma.Descripcion	
      mantenimiento.FechaInicio = ma.FechaInicio
      mantenimiento.FechaTermino = ma.FechaTermino
      mantenimiento.idHabitacion = ma.idHabitacion
      mantenimiento.idMatenimientoH = ma.idMatenimientoH
      mantenimiento.idEmpleado = ma.idEmpleado
      mantenimiento.save!
    end
  end
end
