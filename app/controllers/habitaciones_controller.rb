class HabitacionesController < ApplicationController
    def index
        initialize_habitaciones
        @habitaciones = Habitacion.using(:dwh_t).where(error: true)
    end

    def edit
      @habitaciones = Habitacion.using(:dwh_t).find(params[:id])
    end

    def update
      @habitaciones = Habitacion.using(:dwh_t).find(params[:id])

      if @habitaciones.update(habitaciones_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to habitaciones_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def habitaciones_params
      params.require(:habitacion).permit(:id, :tipo_habitacion, :estado)
    end

  private

  def initialize_habitaciones
    Habitacion.using(:dwh_t).delete_all

    habitaciones = Habitacion.using(:restaurant).all
    habitacion = Habitacion.using(:dwh_t).new()


    habitaciones.each do |ha|
      habitacion = Habitacion.using(:dwh_t).new()
      habitacion.id = ha.idHabitacion
      habitacion.tipo_habitacion = ha.idTipo
      habitacion.estado = ha.Estado
      unless valid_name?(habitacion.estado)
        habitacion.error = true
      end
      habitacion.save!
    end
  end
end
