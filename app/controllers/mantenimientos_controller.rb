class MantenimientosController < ApplicationController
    def index
        @mantenimientoe = Mantenimiento.using(:dwh_t).where(error: true)
    end

    def edit
      @mantenimientoe = Mantenimiento.using(:dwh_t).find(params[:id])
    end

    def destroy
      @mantenimientoe = Mantenimiento.using(:dwh_t).find(params[:id])
      if @mantenimientoe.destroy
        flash[:notice] = 'Eliminado'
      else
        flash[:alert] = 'Error eliminando'
      end
      redirect_to mantenimientos_path
    end

    def update
      @mantenimientoe = Mantenimiento.using(:dwh_t).find(params[:id])
      if validate_attributes && @mantenimientoe.update(mantenimientos_params)
        @mantenimientoe.update_attributes(error: false)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to mantenimientos_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def mantenimientos_params
      params.require(:mantenimiento).permit(:id, :tipo)
    end

    def validate_attributes
      valid_tipomantenimietno(params[:mantenimiento][:tipo])
    end

end
