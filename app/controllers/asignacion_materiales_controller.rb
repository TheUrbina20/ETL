class AsignacionMaterialesController < ApplicationController
    def index

        @asignacionm = AsignacionMaterial.using(:dwh_t).where(error: true)
    end

    def edit
      @asignacionm = AsignacionMaterial.using(:dwh_t).find(params[:id])
    end

    def destroy
      @asignacionm = AsignacionMaterial.using(:dwh_t).find(params[:id])
      if @asignacionm.destroy
        flash[:notice] = 'Eliminado'
      else
        flash[:alert] = 'Error eliminando'
      end
      redirect_to asignacion_materiales_path
    end

    def update
      @asignacionm = AsignacionMaterial.using(:dwh_t).find(params[:id])
      if validate_attributes && @asignacionm.update(asignacion_params)
        @asignacionm.update_attributes(error: false)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to asignacion_materiales_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def delete_with_errors_asignacion_materiales
      AsignacionMaterial.using(:dwh_t).where(error: true).delete_all
      redirect_to landing_page_index_path
    end 

    def asignacion_params
      params.require(:asignacion_material).permit(:id, :cantidad, :id_habitacion, :id_material)
    end

    def validate_attributes
      valid_cantidad?(params[:asignacion_material][:cantidad])
    end

end
