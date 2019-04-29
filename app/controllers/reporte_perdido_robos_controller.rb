class ReportePerdidoRobosController < ApplicationController
    def index

        @reporte = ReportePerdidaRobo.using(:dwh_t).where(error: true)
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

end
