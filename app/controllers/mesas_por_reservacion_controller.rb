class MesasPorReservacionController < ApplicationController
  def index
    @mesas_por_reservacion = MesaPorReservacion.using(:dwh_t).where(error: true)
  end

end
