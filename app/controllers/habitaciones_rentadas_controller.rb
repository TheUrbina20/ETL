class HabitacionesRentadasController < ApplicationController
    def index
        initialize_hrentadas
        @habitacionesrentada = HabitacionRentada.using(:dwh_t).all
    end
 private
    def initialize_hrentadas
        HabitacionRentada.using(:dwh_t).delete_all
    
        habitaciones_r = HabitacionRentada.using(:restaurant).all
        habitacion_r = HabitacionRentada.using(:dwh_t).new()
    
    
        habitaciones_r.each do |hr|
          habitacion_r = HabitacionRentada.using(:dwh_t).new()
          habitacion_r.id_HabitacionR = hr.idHabitacionR
          habitacion_r.id_Renta = hr.idRenta
          habitacion_r.id_Habitacion = hr.idHabitacion
          habitacion_r.save!
        end
      end
end
