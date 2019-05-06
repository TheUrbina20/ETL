class DmantenimientoEquiposController < ApplicationController
  def index
      @mantenimientoe = DmantenimientoEquipo.using(:dwh_t).where(error: true)
  end

  def edit
    @mantenimientoe = DmantenimientoEquipo.using(:dwh_t).find(params[:id])
  end

  def destroy
    @mantenimientoe = DmantenimientoEquipo.using(:dwh_t).find(params[:id])
    if @asistencias.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to dmantenimiento_equipos_path
  end

  def update
    @mantenimientoe = DmantenimientoEquipo.using(:dwh_t).find(params[:id])
    if @mantenimientoe.update(mantenimientos_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to dmantenimiento_equipos_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def mantenimientos_params
    params.require(:dmantenimiento_equipo).permit(:id, :idDetalle, :FechaInicio, :FechaTermino, :idEquipoH, :idMantenimientoE, :idEmpleado)
  end
end
