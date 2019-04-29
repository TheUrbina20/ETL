class DmantenimientoHabitacionesController < ApplicationController
    def index
        initialize_mantenimientoh
        @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).all
    end

    def edit
      @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).find(params[:id])
    end

    def update
      @mantenimientoh = DmantenimientoHabitacion.using(:dwh_t).find(params[:id])

      if @mantenimientoh.update(mantenimientos_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to dmantenimiento_habitaciones_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def mantenimientos_params
      params.require(:dmantenimiento_habitacion).permit(:id, :idDetalle, :Descripcion, :FechaInicio, :FechaTermino, :idHabitacion, :idMantenimientoH, :idEmpleado)
    end

  private

  def initialize_mantenimientoh
    DmantenimientoHabitacion.using(:dwh_t).delete_all

    mantenimientos = DmantenimientoHabitacion.using(:restaurant).all
    mantenimiento = DmantenimientoHabitacion.using(:dwh_t).new()


    mantenimientos.each do |ma|
      mantenimiento = DmantenimientoHabitacion.using(:dwh_t).new()
      mantenimiento.idDetalle = ma.idDetalle
      mantenimiento.Descripcion = ma.Descripcion
      mantenimiento.FechaInicio = ma.FechaInicio
      mantenimiento.FechaTermino = ma.FechaTermino
      mantenimiento.idHabitacion = ma.idHabitacion
      mantenimiento.idMantenimientoH = ma.idMatenimientoH
      mantenimiento.idEmpleado = ma.idEmpleado
      unless valid_date?(mantenimiento.FechaInicio)
        mantenimiento.error = true
      end
      unless valid_date?(mantenimiento.FechaTermino)
        mantenimiento.error = true
      end
      mantenimiento.save!
    end
  end
end
