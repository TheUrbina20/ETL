class ReportePerdidoRobosController < ApplicationController
    def index
        initialize_reporte
        @reporte = ReportePerdidaRobo.using(:dwh_t).all
    end

    def edit
      @reporte = ReportePerdidaRobo.using(:dwh_t).find(params[:id])
    end

    def update
      @reporte = ReportePerdidaRobo.using(:dwh_t).find(params[:id])

      if @reporte.update(serviciosl_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to reporte_perdido_robos_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def serviciosl_params
      params.require(:reporte_perdida_robo).permit(:id, :cantidad, :fecha, :id_servicio_limpieza, :id_habitacion, :id_empleado, :id_material)
    end
 private
    def initialize_reporte
        ReportePerdidaRobo.using(:dwh_t).delete_all

        servicios_h = ReportePerdidaRobo.using(:restaurant).all
        servicio_t = ReportePerdidaRobo.using(:dwh_t).new()


        servicios_h.each do |s|
          servicio_t = ReportePerdidaRobo.using(:dwh_t).new()
          servicio_t.id = s.idReporte
          servicio_t.cantidad = s.Cantidad
          servicio_t.fecha = s.Fecha
          servicio_t.id_servicio_limpieza = s.idServicioLH
          servicio_t.id_habitacion = s.idHabitacion
          servicio_t.id_empleado = s.idEmpleado
          servicio_t.id_material = s.idMaterial
          servicio_t.save!
        end
      end
end
