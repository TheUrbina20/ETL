class HabitacionesReservadasController < ApplicationController
  def index
      initialize_hreservadas
      @habitacionesreservadas = HabitacionReservada.using(:dwh_t).where(error: true)
  end

  private

  def initialize_hreservadas
    HabitacionReservada.using(:dwh_t).delete_all

    habitaciones_r = HabitacionReservada.using(:restaurant).all
    habitacion_r = HabitacionReservada.using(:dwh_t).new

    habitaciones_r.each do |hr|
      habitacion_r = HabitacionReservada.using(:dwh_t).new()
      habitacion_r.id_reservacion = hr.idReservacion
      habitacion_r.id_habitacion = hr.idHabitacion
      habitacion_r.save!
    end
  end
end
