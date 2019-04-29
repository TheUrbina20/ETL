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
          paquete_t.id = pa.idpvr
          paquete_t.id_paquete = pa.idPaquete
          paquete_t.id_renta = pa.idRenta
          paquete_t.id_empleado = pa.idEmpleado
          paquete_t.save!
        end
      end
end
