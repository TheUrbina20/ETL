class ServicioHabitacionesController < ApplicationController
    def index
        initialize_serviciosh
        @servicioh = ServicioHabitacion.using(:dwh_t).all
    end
 private
    def initialize_serviciosh
        ServicioHabitacion.using(:dwh_t).delete_all
    
        servicios_h = ServicioHabitacion.using(:restaurant).all
        servicio_t = ServicioHabitacion.using(:dwh_t).new()
    
    
        servicios_h.each do |s|
          servicio_t = ServicioHabitacion.using(:dwh_t).new()
          servicio_t.idServicioH = s.idServicioH
          servicio_t.idHabitacionR = s.idHabitacionR
          servicio_t.idRenta = s.idRenta
          servicio_t.idHistoricoS = s.idHistoricoS
          servicio_t.idEmpleado = s.idEmpleado
          servicio_t.save!
        end
      end
end
