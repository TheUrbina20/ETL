class HabitacionesRentadasController < ApplicationController
  def index
    @habitacionesrentada = HabitacionRentada.using(:dwh_t).where(error: true)
  end
end
