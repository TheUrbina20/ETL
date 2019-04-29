class CapacitacionesPorEmpleadoController < ApplicationController
  def index
    @capacitaciones = CapacitacionPorEmpleado.using(:dwh_t).where(error: true)
  end

  def edit
    @capacitaciones = CapacitacionPorEmpleado.using(:dwh_t).find(params[:id])
  end

  def update
    @capacitaciones = CapacitacionPorEmpleado.using(:dwh_t).find(params[:id])

    if @capacitaciones.update(capacitacion_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to capacitaciones_por_empleado_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def capacitacion_params
    params.require(:capacitacion_por_empleado).permit(:id, :id_empleado, :id_capacitacion, :f_inicio, :f_fin, :estado)
  end

  private

end
