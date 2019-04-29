class HabitacionesRentadasController < ApplicationController
  def index
      initialize_hrentadas
      @habitacionesrentada = HabitacionRentada.using(:dwh_t).where(error: true)
  end

  private

  def initialize_hrentadas
      HabitacionRentada.using(:dwh_t).delete_all

      habitaciones_r = HabitacionRentada.using(:restaurant).all
      habitacion_r = HabitacionRentada.using(:dwh_t).new

      habitaciones_r.each do |hr|
        habitacion_r = HabitacionRentada.using(:dwh_t).new
        habitacion_r.id = hr.idHabitacionR
        habitacion_r.id_renta = hr.idRenta
        habitacion_r.id_habitacion = hr.idHabitacion
        habitacion_r.save!
      end
    end
end
