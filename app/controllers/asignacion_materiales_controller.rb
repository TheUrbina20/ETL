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
      @asignacionm.update(asignacion_params)
      if validate_attributes 
        @asignacionm.update_attributes(error: false)
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

    def validate_attributes 
      valid_cantidad?(@asignacionm.cantidad)   
    end

end
