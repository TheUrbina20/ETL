class ServiciosController < ApplicationController
    def index
        initialize_servicios
        @servicio = Servicio.using(:dwh_t).all
    end
 private
    def initialize_servicios
        Servicio.using(:dwh_t).delete_all
    
        servicios_h = Servicio.using(:restaurant).all
        servicio_t = Servicio.using(:dwh_t).new()
    
    
        servicios_h.each do |s|
          servicio_t = Servicio.using(:dwh_t).new()
          servicio_t.idServicio = s.idServicio
          servicio_t.Nombre = s.Nombre
          servicio_t.save!
        end
      end
end
