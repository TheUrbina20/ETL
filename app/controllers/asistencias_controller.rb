class AsistenciasController < ApplicationController
  def index

    @asistencias = Asistencia.using(:dwh_t).where(error: true)
  end

  def edit
    @asistencias = Asistencia.using(:dwh_t).find(params[:id])
  end

  def destroy
    @asistencias = Asistencia.using(:dwh_t).find(params[:id])
    if @asistencias.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to asistencias_path
  end

  def update
    @asistencias = Asistencia.using(:dwh_t).find(params[:id])
    if validate_attributes && @asistencias.update(areas_params)
      @asistencias.update_attributes(error: false)
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

  def validate_attributes
    valid_date?(@asistencias.fecha)
  end

end
