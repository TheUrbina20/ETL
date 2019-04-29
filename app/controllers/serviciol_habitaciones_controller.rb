class ServiciolHabitacionesController < ApplicationController
    def index
        initialize_servicioslh
        @serviciolh = ServiciolHabitacion.using(:dwh_t).all
    end
    def edit
      @serviciolh = ServiciolHabitacion.using(:dwh_t).find(params[:id])
    end

    def update
      @serviciolh = ServiciolHabitacion.using(:dwh_t).find(params[:id])

      if @serviciolh.update(serviciosl_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to serviciol_habitaciones_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def serviciosl_params
      params.require(:serviciol_habitacion).permit(:id, :fecha, :id_servicio_limpieza, :id_habitacion, :id_empleado)
    end
 private
    def initialize_servicioslh
        ServiciolHabitacion.using(:dwh_t).delete_all

        servicios_h = ServiciolHabitacion.using(:restaurant).all
        servicio_t = ServiciolHabitacion.using(:dwh_t).new

        servicios_h.each do |s|
          servicio_t = ServiciolHabitacion.using(:dwh_t).new
          servicio_t.id= s.idServicioLH
          servicio_t.fecha = s.Fecha
          servicio_t.id_servicio_limpieza = s.idServicioL
          servicio_t.id_habitacion = s.idHabitacion
          servicio_t.id_empleado = s.idEmpleado
          unless valid_date?(servicio_t.fecha)
            servicio_t.error = true
          end
          servicio_t.save!
        end
      end
end
