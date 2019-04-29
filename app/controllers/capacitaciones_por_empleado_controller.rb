class CapacitacionesPorEmpleadoController < ApplicationController
  def index
    initialice_capacitaciones
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

  def initialice_capacitaciones
    CapacitacionPorEmpleado.using(:dwh_t).destroy_all
    capacitaciones = CapacitacionPorEmpleado.using(:rrhh).all

    capacitaciones.each do |capacitacion_r|
      capacitacion = CapacitacionPorEmpleado.using(:dwh_t).new()

      capacitacion.id = capacitacion_r.id
      capacitacion.id_programa = capacitacion_r.id_programa
      capacitacion.id_empleado = capacitacion_r.id_empleado
      capacitacion.f_inicio = capacitacion_r.f_inicio
      capacitacion.f_fin = capacitacion_r.f_fin
      capacitacion.estado = capacitacion_r.estado
      unless valid_date?(capacitacion.f_inicio)
        capacitacion.error = true
      end
      unless valid_date?(capacitacion.f_fin)
        capacitacion.error = true
      end
      unless valid_name?(capacitacion.f_fin)
        capacitacion.error = true
      end
      capacitacion.save!
    end

  end
end
