class AreasPorEmpleadoController < ApplicationController
  def index
    @areas_por_empleado = AreasPorEmpleado.using(:dwh_t).where(error: true)
  end

  def edit
    @areas_por_empleado = AreasPorEmpleado.using(:dwh_t).find(params[:id])
  end

  def destroy
    @areas_por_empleado = AreasPorEmpleado.using(:dwh_t).find(params[:id])
    if @areas_por_empleado.destroy
      flash[:notice] = 'Elminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to areas_por_empleado_index_path
  end

  def update
    @areas_por_empleado = AreasPorEmpleado.using(:dwh_t).find(params[:id])
    @areas_por_empleado.update(areas_params)
    if validate_attributes 
      @areas_por_empleado.update_attributes(error: false)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to areas_por_empleado_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def areas_params
    params.require(:areas_por_empleado).permit(:id, :id_area, :id_empleado, :f_asignacion)
  end

  def validate_attributes 
    valid_date?(@areas_por_empleado.f_asignacion)
  end
end
