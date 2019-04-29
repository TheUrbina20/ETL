class HabitacionesReservadasController < ApplicationController
  def index

      @habitacionesreservadas = HabitacionReservada.using(:dwh_t).where(error: true)
  end
end
