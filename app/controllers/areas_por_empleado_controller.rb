class AreasPorEmpleadoController < ApplicationController
  def index
    initialize_areas_por_empleado
    @areas_por_empleado = AreasPorEmpleado.using(:dwh_t).all
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
      flash[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def areas_params
    params.require(:areas_por_empleado).permit(:id, :nombre, :clave)
  end

  private

  def initialize_areas_por_empleado
    area=AreasPorEmpleado.using(:dwh_t).delete_all

    areas = AreasPorEmpleado.using(:rrhh).all

    areas.each do |area_r|
      area = AreasPorEmpleado.using(:dwh_t).new()

      area.id_area = area_r.id_area
      area.id_empleado = area_r.id_empleado
      area.fechasignacion = area_r.fechasignacion
      area.save!
    end
  end
end
