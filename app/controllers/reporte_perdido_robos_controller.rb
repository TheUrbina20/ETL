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
        flash[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def serviciosl_params
      params.require(:reporte_perdida_robo).permit(:id, :idReporte, :Cantidad, :Fecha, :idServicioLH, :idHabitacion, :idEmpleado, :idMaterial)
    end
 private
    def initialize_reporte
        ReportePerdidaRobo.using(:dwh_t).delete_all
    
        servicios_h = ReportePerdidaRobo.using(:restaurant).all
        servicio_t = ReportePerdidaRobo.using(:dwh_t).new()
    
    
        servicios_h.each do |s|
          servicio_t = ReportePerdidaRobo.using(:dwh_t).new()
          servicio_t.idReporte = s.idReporte
          servicio_t.Cantidad = s.Cantidad
          servicio_t.Fecha = s.Fecha
          servicio_t.idServicioLH = s.idServicioLH
          servicio_t.idHabitacion = s.idHabitacion
          servicio_t.idEmpleado = s.idEmpleado
          servicio_t.idMaterial = s.idMaterial
          servicio_t.save!
        end
      end
end
