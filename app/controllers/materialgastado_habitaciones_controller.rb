class MaterialgastadoHabitacionesController < ApplicationController
    def index
        initialize_mgh
        @materialgh = MgHabitacion.using(:dwh_t).all
    end

    def edit
      @materialgh = MgHabitacion.using(:dwh_t).find(params[:id]) 
    end

    def update
      @materialgh = MgHabitacion.using(:dwh_t).find(params[:id])

      if @materialgh.update(hservicios_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to materialgastado_habitaciones_path
      else 
        flash[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def hservicios_params
      params.require(:mg_habitacion).permit(:id, :idMaterialH, :Cantidad, :Material, :idServicioLH)
    end

  private

  def initialize_mgh
    MgHabitacion.using(:dwh_t).delete_all

    materiales = MgHabitacion.using(:restaurant).all
    material = MgHabitacion.using(:dwh_t).new()


    materiales.each do |se|
      material = MgHabitacion.using(:dwh_t).new()
      material.idMaterialH = se.idMaterialH 	
      material.Cantidad = se.Cantidad	
      material.idMaterial = se.idMaterial
      material.idServicioLH = se.idServicioLH
      material.save!
    end
  end
end
