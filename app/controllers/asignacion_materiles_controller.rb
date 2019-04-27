class AsignacionMaterilesController < ApplicationController
    def index
        initialize_mgh
        @asignacionm = AsignacionMaterial.using(:dwh_t).all
    end

    def edit
      @asignacionm = AsignacionMaterial.using(:dwh_t).find(params[:id]) 
    end

    def update
      @asignacionm = AsignacionMaterial.using(:dwh_t).find(params[:id])

      if @asignacionm.update(asignacion_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to asignacion_materiles_path
      else 
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def asignacion_params
      params.require(:asignacion_material).permit(:id, :idAsignacion, :Cantidad, :idHabitacion, :idMaterial)
    end

  private

  def initialize_mgh
    AsignacionMaterial.using(:dwh_t).delete_all

    materiales = AsignacionMaterial.using(:restaurant).all
    material = AsignacionMaterial.using(:dwh_t).new()


    materiales.each do |se|
      material = AsignacionMaterial.using(:dwh_t).new()
      material.idAsignacion = se.idAsignacion 	
      material.Cantidad = se.Cantidad	
      material.idHabitacion = se.idHabitacion
      material.idMaterial = se.idMaterial
      material.save!
    end
  end
end
