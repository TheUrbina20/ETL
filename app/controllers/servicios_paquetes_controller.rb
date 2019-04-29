class ServiciosPaquetesController < ApplicationController
  def index
    @serviciop = ServicioPaquete.using(:dwh_t).where(error: true)
  end
end
