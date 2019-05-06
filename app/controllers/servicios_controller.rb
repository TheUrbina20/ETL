class ServiciosController < ApplicationController
    def index
        @servicio = Servicio.using(:dwh_t).where(error: true)
    end

    def edit
      @servicio = Servicio.using(:dwh_t).find(params[:id])
    end

    def destroy
      @servicio = Servicio.using(:dwh_t).find(params[:id])
      if @servicio.destroy
        flash[:notice] = 'Eliminado'
      else
        flash[:alert] = 'Error eliminando'
      end
      redirect_to servicios_path
    end

    def update
      @servicio = Servicio.using(:dwh_t).find(params[:id])
      if validate_attributes && @servicio.update(servicios_params)
        @servicio.update_attributes(error: false)
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

    def validate_attributes
      valid_nombrecosas?(@servicio.nombre)
    end


end
