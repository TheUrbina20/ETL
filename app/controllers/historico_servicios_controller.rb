class HistoricoServiciosController < ApplicationController
    def index
        initialize_servicios
        @historicos = HistoricoServicio.using(:dwh_t).all
    end

    def edit
      @historicos = HistoricoServicio.using(:dwh_t).find(params[:id]) 
    end

    def update
      @historicos = HistoricoServicio.using(:dwh_t).find(params[:id])

      if @historicos.update(hservicios_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to historico_servicios_path
      else 
        flash[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def hservicios_params
      params.require(:historico_servicio).permit(:id, :idHistorico, :Precio, :FechaInicio, :FechaTermino, :idServicio)
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
