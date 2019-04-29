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
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def hservicios_params
      params.require(:historico_servicio).permit(:id,:precio, :f_inicio, :f_termino, :id_servicio)
    end

  private

  def initialize_servicios
    HistoricoServicio.using(:dwh_t).delete_all

    historicos = HistoricoServicio.using(:restaurant).all
    historico = HistoricoServicio.using(:dwh_t).new()


    historicos.each do |se|
      historico = HistoricoServicio.using(:dwh_t).new()
      historico.id = se.idHistorico
      historico.precio = se.Precio
      historico.f_inicio = se.FechaInicio
      historico.f_termino = se.FechaTermino
      historico.id_servicio = se.idServicio
      unless valid_date?(historico.f_inicio)
        historico.error
      end
      unless valid_date?(historico.f_termino)
        historico.error
      end
      historico.save!
    end
  end
end
