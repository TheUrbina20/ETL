class ServiciolHabitacionesController < ApplicationController
    def index
        initialize_servicioslh
        @serviciolh = ServiciolHabitacion.using(:dwh_t).all
    end
 private
    def initialize_servicioslh
        ServiciolHabitacion.using(:dwh_t).delete_all
    
        servicios_h = ServiciolHabitacion.using(:restaurant).all
        servicio_t = ServiciolHabitacion.using(:dwh_t).new()
    
    
        servicios_h.each do |s|
          servicio_t = ServiciolHabitacion.using(:dwh_t).new()
          servicio_t.idServicioLH = s.idServicioLH
          servicio_t.Fecha = s.Fecha
          servicio_t.idServicioL = s.idServicioL
          servicio_t.idHabitacion = s.idHabitacion
          servicio_t.idEmpleado = s.idEmpleado
          servicio_t.save!
        end
      end
end
