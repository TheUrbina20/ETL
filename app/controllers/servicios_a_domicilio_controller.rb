class ServiciosADomicilioController < ApplicationController
  def index
    initialize_servicios
    initialize_mesas_por_reservacion
    @servicios = ServicioADomicilio.using(:dwh_t).all
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

  def initialize_servicios
    ServicioADomicilio.using(:dwh_t).delete_all
    servicios = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Servicio_hotel']

    servicios.each do |servicio_r|
      servicio = ServicioADomicilio.using(:dwh_t).new()

      servicio.id = servicio_r[:id]
      servicio.id_habitacion = servicio_r[:id_habitacion]
      servicio.fecha = servicio_r[:fecha]
      unless valid_date?(servicio.fecha)
        servicio.error = true
      end
      servicio.save!
    end
  end

  def initialize_mesas_por_reservacion
    ReservacionPorMesa.using(:dwh_t).delete_all
    mesas_por_reservacion = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Reservacion_mesa']

    mesas_por_reservacion.each do |servicio_r|
      servicio = ReservacionPorMesa.using(:dwh_t).new()

      servicio.id = servicio_r[:Id]
      servicio.id_reservacion = servicio_r[:id_reservac]
      servicio.id_mesa = servicio_r[:id_mesa]
      servicio.estado = servicio_r[:estado]
      servicio.save!
    end
  end
end
