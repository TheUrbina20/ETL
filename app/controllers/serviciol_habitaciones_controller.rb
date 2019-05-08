class ServiciolHabitacionesController < ApplicationController
    def index
        @serviciolh = ServiciolHabitacion.using(:dwh_t).where(error: true)
    end
    def edit
      @serviciolh = ServiciolHabitacion.using(:dwh_t).find(params[:id])
    end

    def destroy
      @serviciolh = ServiciolHabitacion.using(:dwh_t).find(params[:id])
      if @serviciolh.destroy
        flash[:notice] = 'Eliminado'
      else
        flash[:alert] = 'Error eliminando'
      end
      redirect_to serviciol_habitaciones_path
    end

    def update
      @serviciolh = ServiciolHabitacion.using(:dwh_t).find(params[:id])
      if validate_attributes && @serviciolh.update(serviciosl_params)
        @serviciolh.update_attributes(error: false)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to serviciol_habitaciones_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def delete_with_errors_servicio_limpieza_habitaciones
      ServiciolHabitacion.using(:dwh_t).where(error: true).delete_all
      redirect_to landing_page_index_path
    end 

    def serviciosl_params
      params.require(:serviciol_habitacion).permit(:id, :fecha, :id_servicio_limpieza, :id_habitacion, :id_empleado)
    end

    def validate_attributes
      valid_date?(params[:serviciol_habitacion][:fecha])
    end

end
