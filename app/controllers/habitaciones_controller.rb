class HabitacionesController < ApplicationController
    def index
        initialize_habitaciones
        @habitaciones = Habitacion.using(:dwh_t).all
    end

  private

  def initialize_habitaciones
    Habitacion.using(:dwh_t).delete_all

    habitaciones = Habitacion.using(:restaurant).all
    habitacion = Habitacion.using(:dwh_t).new()


    habitaciones.each do |ha|
      habitacion = Habitacion.using(:dwh_t).new()
      habitacion.id_habitacion = ha.idHabitacion
      habitacion.tipo_h = ha.idTipo
      habitacion.estado_h = ha.Estado
      habitacion.save!
    end
  end
end
