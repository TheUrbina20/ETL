class ServiciosADomicilioController < ApplicationController
  def index
    @servicios = ServicioADomicilio.using(:dwh_t).where(error: true)
  end

  def edit
    @servicio_a_domicilio = ServicioADomicilio.using(:dwh_t).find(params[:id])
  end

  def destroy
    @servicio_a_domicilio = ServicioADomicilio.using(:dwh_t).find(params[:id])
    if @servicio_a_domicilio.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to servicios_a_domicilio_index_path
  end

  def update
    @servicio_a_domicilio = ServicioADomicilio.using(:dwh_t).find(params[:id])
    if validate_attributes && @servicio_a_domicilio.update(servicio_a_domicilio_params)
      @servicio_a_domicilio.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to servicios_a_domicilio_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def servicio_a_domicilio_params
    params.require(:servicio_a_domicilio).permit(:id_habitacion, :fecha)
  end
  def validate_attributes
    valid_date?(params[:servicio_a_domicilio][:fecha])
  end
end
