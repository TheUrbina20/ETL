class ServicioHabitacionesController < ApplicationController
  def index
     @servicioh = ServicioHabitacion.using(:dwh_t).where(error: true)
  end

  def edit
    @servicio_habitacion = ServicioHabitacion.using(:dwh_t).find(params[:id])
  end

  def destroy
    @servicio_habitacion = ServicioHabitacion.using(:dwh_t).find(params[:id])
    if @servicio_habitacion.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to servicio_habitaciones_path
  end

  def update
    @servicio_habitacion = ServicioHabitacion.using(:dwh_t).find(params[:id])
    if @servicio_habitacion.update(servicio_habitacion_params)
      flash[:notice] = 'Actualizado'
      redirect_to servicio_habitaciones_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def servicio_habitacion_params
    params.require(:servicio_habitacion).permit(:id_habitacion_rentada, :id_renta, :id_historico_servicio, :id_empleado)
  end

  private

end
