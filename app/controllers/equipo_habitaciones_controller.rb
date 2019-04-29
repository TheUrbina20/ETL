class EquipoHabitacionesController < ApplicationController
    def index
      @equiposh = EquipoHabitacion.using(:dwh_t).where(error: true)
    end
end
