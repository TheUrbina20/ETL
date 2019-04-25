class HabitacionesReservadasController < ApplicationController
    def index
        initialize_hreservadas
        @habitacionesreservadas = HabitacionReservada.using(:dwh_t).all
    end
 private
    def initialize_hreservadas
        HabitacionReservada.using(:dwh_t).delete_all
    
        habitaciones_r = HabitacionReservada.using(:restaurant).all
        habitacion_r = HabitacionReservada.using(:dwh_t).new()
    
    
        habitaciones_r.each do |hr|
          habitacion_r = HabitacionReservada.using(:dwh_t).new()
          habitacion_r.idHabitacionR = hr.idHabitacionR
          habitacion_r.idReservacion = hr.idReservacion
          habitacion_r.idHabitacion = hr.idHabitacion
          habitacion_r.save!
        end
      end
end
