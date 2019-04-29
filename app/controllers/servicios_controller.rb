class ServiciosController < ApplicationController
    def index

        @servicio = Servicio.using(:dwh_t).where(error: true)
    end
    def edit
      @servicio = Servicio.using(:dwh_t).find(params[:id])
    end

    def update
      @servicio = Servicio.using(:dwh_t).find(params[:id])

      if @servicio.update(servicios_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to servicios_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def servicios_params
      params.require(:servicio).permit(:id, :nombre)
    end


end
