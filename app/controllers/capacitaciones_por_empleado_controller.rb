class CapacitacionesPorEmpleadoController < ApplicationController
  def index
    @capacitaciones = CapacitacionPorEmpleado.using(:dwh_t).where(error: true)
  end

  def edit
    @capacitaciones = CapacitacionPorEmpleado.using(:dwh_t).find(params[:id])
  end

  def destroy
    @capacitaciones = CapacitacionPorEmpleado.using(:dwh_t).find(params[:id])
    if @capacitaciones.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to capacitaciones_por_empleado_index_path
  end


  def update
    @capacitaciones = CapacitacionPorEmpleado.using(:dwh_t).find(params[:id])
    if validate_attributes && @capacitaciones.update(capacitacion_params)
      @capacitaciones.update_attributes(error: false)
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

  def validate_attributes
    valid_date?(params[:capacitacion_por_empleado][:f_inicio]) && valid_date?(params[:capacitacion_por_empleado][:f_fin]) && valid_estado_capacitacion?(params[:capacitacion_por_empleado][:estado])
  end

end
