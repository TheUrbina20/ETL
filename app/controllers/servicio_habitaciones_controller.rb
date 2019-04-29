class ServicioHabitacionesController < ApplicationController
  def index
      initialize_serviciosh
      @servicioh = ServicioHabitacion.using(:dwh_t).where(error: true)
  end

  def edit
    @servicio_habitacion = ServicioHabitacion.using(:dwh_t).find(params[:id])
  end

  def update
    @servicio_habitacion = ServicioHabitacion.using(:dwh_t).find(params[:id])
    if @servicio_habitacion.update(servicio_habitacion_params)
      flash[:notice] = 'Actualizado'
      redirect_to servicio_habitaciones_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def servicio_habitacion_params
    params.require(:servicio_habitacion).permit(:id_habitacion_rentada, :id_renta, :id_historico_servicio, :id_empleado)
  end

  private

  def initialize_serviciosh
    ServicioHabitacion.using(:dwh_t).delete_all

    servicios_h = ServicioHabitacion.using(:restaurant).all
    servicio_t = ServicioHabitacion.using(:dwh_t).new()


    servicios_h.each do |s|
      servicio_t = ServicioHabitacion.using(:dwh_t).new()
      servicio_t.id = s.idServicioH
      servicio_t.id_habitacion_rentada = s.idHabitacionR
      servicio_t.id_renta = s.idRenta
      servicio_t.id_historico_servicio = s.idHistoricoS
      servicio_t.id_empleado = s.idEmpleado
      servicio_t.save!
    end
  end
end
