class HistoricoServiciosController < ApplicationController
    def index

        @historicos = HistoricoServicio.using(:dwh_t).where(error: true)
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

end
