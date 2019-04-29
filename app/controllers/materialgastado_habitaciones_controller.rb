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
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def hservicios_params
      params.require(:mg_habitacion).permit(:id, :cantidad, :id_material_por_recibo, :id_servicio_limpieza)
    end

  private

  def initialize_mgh
    MgHabitacion.using(:dwh_t).delete_all

    materiales = MgHabitacion.using(:restaurant).all
    material = MgHabitacion.using(:dwh_t).new()


    materiales.each do |se|
      material = MgHabitacion.using(:dwh_t).new()
      material.id = se.id
      material.cantidad = se.Cantidad
      material.id_material_por_recibo = se.idMaterial
      material.id_servicio_limpieza = se.idServicioLH
      unless valid_number?(material.cantidad)
        material.error = true
      end

      material.save!
    end
  end
end
