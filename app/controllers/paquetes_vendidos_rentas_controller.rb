class PaquetesVendidosRentasController < ApplicationController
    def index
        @paquetevr = PaqueteVendidoRenta.using(:dwh_t).where(error: true)
    end
end
