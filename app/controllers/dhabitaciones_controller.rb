class DhabitacionesController < ApplicationController
  def index

      @dhabitaciones = Dhabitacion.using(:dwh_t).where(error: true)
  end

  def edit
    @dhabitaciones = Dhabitacion.using(:dwh_t).find(params[:id])
  end

  def destroy
    @dhabitaciones = Dhabitacion.using(:dwh_t).find(params[:id])
    if @dhabitaciones.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to dhabitaciones_path
  end

  def update
    @dhabitaciones = Dhabitacion.using(:dwh_t).find(params[:id])
    if validate_attributes && @dhabitaciones.update(dhabitaciones_params)
      @dhabitaciones.update_attributes(error: false)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to dhabitaciones_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def dhabitaciones_params
    params.require(:dhabitacion).permit(:id, :nombre, :precio)
  end

  def validate_attributes
    valid_nombrecosas?(params[:dhabitacion][:nombre]) && valid_price?(params[:dhabitacion][:precio])
  end
end
