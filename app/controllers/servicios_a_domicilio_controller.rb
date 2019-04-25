class ServiciosADomicilioController < ApplicationController
  def index
    initialize_servicios
    initialize_mesas_por_reservacion
    @servicios = ServicioADomicilio.using(:dwh_t).all
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
