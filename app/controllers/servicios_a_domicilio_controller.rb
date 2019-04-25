class ServiciosADomicilioController < ApplicationController
  def index
    initialize_servicios
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
end
