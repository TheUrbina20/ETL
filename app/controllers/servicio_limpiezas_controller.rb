class ServicioLimpiezasController < ApplicationController
    def index

        @serviciol = ServicioLimpieza.using(:dwh_t).where(error: true)
    end

    def edit
      @serviciol = ServicioLimpieza.using(:dwh_t).find(params[:id])
    end

    def update
      @serviciol = ServicioLimpieza.using(:dwh_t).find(params[:id])

      if @serviciol.update(serviciosl_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to servicio_limpiezas_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def serviciosl_params
      params.require(:servicio_limpieza).permit(:id, :nombre)
    end

end
