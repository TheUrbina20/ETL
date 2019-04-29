class AreasPorEmpleadoController < ApplicationController
  def index
    @areas_por_empleado = AreasPorEmpleado.using(:dwh_t).where(error: true)
  end

  def edit
    @areas_por_empleado = AreasPorEmpleado.using(:dwh_t).find(params[:id])
  end

  def update
    @areas_por_empleado = AreasPorEmpleado.using(:dwh_t).find(params[:id])

    if @areas_por_empleado.update(areas_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to areas_por_empleado_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def areas_params
    params.require(:areas_por_empleado).permit(:id, :nombre, :clave)
  end
end
