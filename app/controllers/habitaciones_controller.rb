class HabitacionesController < ApplicationController
  def index
      @habitaciones = Habitacion.using(:dwh_t).where(error: true)
  end

  def edit
    @habitaciones = Habitacion.using(:dwh_t).find(params[:id])
    end

  def destroy
    @habitaciones = Habitacion.using(:dwh_t).find(params[:id])
    if @habitaciones.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to habitaciones_path
  end

  def update
    @habitaciones = Habitacion.using(:dwh_t).find(params[:id])

    if @habitaciones.update(habitaciones_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to habitaciones_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def habitaciones_params
    params.require(:habitacion).permit(:id, :tipo_habitacion, :estado)
  end
end
