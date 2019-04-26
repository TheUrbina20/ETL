class PaquetesVendidosRentasController < ApplicationController
    def index
        initialize_paquetesvr
        @paquetevr = PaqueteVendidoRenta.using(:dwh_t).all
    end
 private
    def initialize_paquetesvr
        PaqueteVendidoRenta.using(:dwh_t).delete_all
    
        paquetes_h = PaqueteVendidoRenta.using(:restaurant).all
        paquete_t = PaqueteVendidoRenta.using(:dwh_t).new()
    
    
        paquetes_h.each do |pa|
          paquete_t = PaqueteVendidoRenta.using(:dwh_t).new()
          paquete_t.idpvr = pa.idpvr
          paquete_t.idPaquete = pa.idPaquete
          paquete_t.idRenta = pa.idRenta
          paquete_t.idEmpleado = pa.idEmpleado
          paquete_t.save!
        end
      end
end
