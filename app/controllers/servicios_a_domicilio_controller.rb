class ServiciosADomicilioController < ApplicationController
  def index

    @servicios = ServicioADomicilio.using(:dwh_t).where(error: true)
  end

  def edit
    @servicio_a_domicilio = ServicioADomicilio.using(:dwh_t).find(params[:id])
  end

  def update
    @servicio_a_domicilio = ServicioADomicilio.using(:dwh_t).find(params[:id])
    if @servicio_a_domicilio.update(servicio_a_domicilio_params)
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

  private

end
