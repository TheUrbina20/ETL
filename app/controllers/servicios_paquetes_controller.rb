class ServiciosPaquetesController < ApplicationController
    def index
        initialize_serviciosp
        @serviciop = ServicioPaquete.using(:dwh_t).all
    end
 private
    def initialize_serviciosp
        ServicioPaquete.using(:dwh_t).delete_all
    
        servicios_h = ServicioPaquete.using(:restaurant).all
        servicio_t = ServicioPaquete.using(:dwh_t).new()
    
    
        servicios_h.each do |s|
          servicio_t = ServicioPaquete.using(:dwh_t).new()
          servicio_t.idServicioP = s.idServicioP
          servicio_t.idHistoricoS = s.idHistoricoS
          servicio_t.idPaquete = s.idPaquete    
          servicio_t.save!
        end
      end
end
