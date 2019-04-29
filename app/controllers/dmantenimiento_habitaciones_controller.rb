class DmantenimientoHabitacionesController < ApplicationController
  def index
      @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).where(error: true)
  end

  def edit
    @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).find(params[:id])
  end

  def update
    @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).find(params[:id])

    if @mantenimientoh.update(mantenimientos_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to dmantenimiento_habitaciones_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def mantenimientos_params
    params.require(:dmantenimiento_habitacion).permit(:id, :idDetalle, :Descripcion, :FechaInicio, :FechaTermino, :idHabitacion, :idMantenimientoH, :idEmpleado)
  end
end
