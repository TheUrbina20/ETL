class AsignacionMaterialesController < ApplicationController
    def index

        @asignacionm = AsignacionMaterial.using(:dwh_t).where(error: true)
    end

    def edit
      @asignacionm = AsignacionMaterial.using(:dwh_t).find(params[:id])
    end

    def update
      @asignacionm = AsignacionMaterial.using(:dwh_t).find(params[:id])

      if @asignacionm.update(asignacion_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to asignacion_materiales_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def asignacion_params
      params.require(:asignacion_material).permit(:id, :cantidad, :id_habitacion, :id_material)
    end

  private

end
