class PaquetesController < ApplicationController
    def index
        initialize_paquetes
        @paquete = Paquete.using(:dwh_t).all
    end
 private
    def initialize_paquetes
        Paquete.using(:dwh_t).delete_all
    
        paquetes_h = Paquete.using(:restaurant).all
        paquete_t = Paquete.using(:dwh_t).new()
    
    
        paquetes_h.each do |pa|
          paquete_t = Paquete.using(:dwh_t).new()
          paquete_t.idPaquete = pa.idPaquete
          paquete_t.Nombre = pa.Nombre
          paquete_t.Descripcion = pa.Descripcion
          paquete_t.PrecioDia = pa.PrecioDia
          paquete_t.save!
        end
      end
end
