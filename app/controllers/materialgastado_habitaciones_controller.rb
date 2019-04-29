class MaterialgastadoHabitacionesController < ApplicationController
    def index

        @materialgh = MgHabitacion.using(:dwh_t).where(error: true)
    end

    def edit
      @materialgh = MgHabitacion.using(:dwh_t).find(params[:id])
    end

    def destroy
      @materialgh = MgHabitacion.using(:dwh_t).find(params[:id])
      if @materialgh.destroy
        flash[:notice] = 'Eliminado'
      else
        flash[:alert] = 'Error eliminando'
      end
      redirect_to materialgastado_habitaciones_path
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

end
