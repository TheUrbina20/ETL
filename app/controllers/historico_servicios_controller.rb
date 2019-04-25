class HistoricoServiciosController < ApplicationController
    def index
        initialize_servicios
        @historicos = HistoricoServicio.using(:dwh_t).all
    end

  private

  def initialize_servicios
    HistoricoServicio.using(:dwh_t).delete_all

    historicos = HistoricoServicio.using(:restaurant).all
    historico = HistoricoServicio.using(:dwh_t).new()


    historicos.each do |se|
      historico = HistoricoServicio.using(:dwh_t).new()
      historico.idHistorico = se.idHistorico	
      historico.Precio = se.Precio	
      historico.FechaInicio = se.FechaInicio
      historico.FechaTermino = se.FechaTermino
      historico.idServicio = se.idServicio
      historico.save!
    end
  end
end
