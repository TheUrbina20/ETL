class DmantenimientoHabitacionesController < ApplicationController
  def index
      @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).where(error: true)
  end

  def edit
    @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).find(params[:id])
  end


  def destroy
    @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).find(params[:id])
    if @mantenimientoh.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to dmantenimiento_habitaciones_path
  end

  def update
    @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).find(params[:id])
    if validacion && @mantenimientoh.update(mantenimientos_params)
      @mantenimientoh.update_attributes(error: false)
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

  def validacion
    valid_date?(@mantenimientoh.FechaInicio) && valid_date?(@mantenimientoh.FechaTermino)
  end
end
