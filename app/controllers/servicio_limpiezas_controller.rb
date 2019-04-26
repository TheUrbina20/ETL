class ServicioLimpiezasController < ApplicationController
    def index
        initialize_serviciosl
        @serviciol = ServicioLimpieza.using(:dwh_t).all
    end
 private
    def initialize_serviciosl
        ServicioLimpieza.using(:dwh_t).delete_all
    
        servicios_h = ServicioLimpieza.using(:restaurant).all
        servicio_t = ServicioLimpieza.using(:dwh_t).new()
    
    
        servicios_h.each do |s|
          servicio_t = ServicioLimpieza.using(:dwh_t).new()
          servicio_t.idServicioL = s.idServicioL
          servicio_t.Nombre = s.Nombre
          servicio_t.save!
        end
      end
end
