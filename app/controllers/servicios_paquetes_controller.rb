class ServiciosPaquetesController < ApplicationController
  def index
    initialize_serviciosp
    @serviciop = ServicioPaquete.using(:dwh_t).where(error: true)
  end

  private

  def initialize_serviciosp
    ServicioPaquete.using(:dwh_t).delete_all

    servicios_h = ServicioPaquete.using(:restaurant).all
    servicio_t = ServicioPaquete.using(:dwh_t).new()


    servicios_h.each do |s|
      servicio_t = ServicioPaquete.using(:dwh_t).new()
      servicio_t.id = s.idServicioP
      servicio_t.id_historico_servicio = s.idHistoricoS
      servicio_t.id_paquete = s.idPaquete
      servicio_t.save!
    end
  end
end
