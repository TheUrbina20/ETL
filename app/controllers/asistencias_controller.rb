class AsistenciasController < ApplicationController
  def index
    initialize_asistencias
    @asistencias = Asistencia.using(:dwh_t).all
  end

  def edit
    @asistencias = Asistencia.using(:dwh_t).find(params[:id]) 
  end

  def update
    @asistencias = Asistencia.using(:dwh_t).find(params[:id])

    if @asistencias.update(areas_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to asistencias_path
    else 
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def areas_params
    params.require(:asistencia).permit(:id, :id_empleado, :fecha, :hora_entrada, :hora_salida)
  end

  private

  def initialize_asistencias
    asistencia = Asistencia.using(:dwh_t).destroy_all

    asistencias = Asistencia.using(:rrhh).all

    asistencias.each do |asistencia_r|
      asistencia = Asistencia.using(:dwh_t).new()

      asistencia.id = asistencia_r.id
      asistencia.id_empleado = asistencia_r.id_empleado
      asistencia.fecha = asistencia_r.fecha
      asistencia.hora_entrada = asistencia_r.h_entrada
      asistencia.hora_salida = asistencia_r.h_salida
      asistencia.save!
    end
  end
end
