class DmantenimientoEquiposController < ApplicationController
    def index
        initialize_mantenimiento
        @mantenimientoe = DmantenimientoEquipo.using(:dwh_t).where(error: true)
    end

    def edit
      @mantenimientoe = DmantenimientoEquipo.using(:dwh_t).find(params[:id])
    end

    def update
      @mantenimientoe = DmantenimientoEquipo.using(:dwh_t).find(params[:id])

      if @mantenimientoe.update(mantenimientos_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to dmantenimiento_equipos_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def mantenimientos_params
      params.require(:dmantenimiento_equipo).permit(:id, :idDetalle, :FechaInicio, :FechaTermino, :idEquipoH, :idMantenimientoE, :idEmpleado)
    end

  private

  def initialize_mantenimiento
    DmantenimientoEquipo.using(:dwh_t).delete_all

    mantenimientos = DmantenimientoEquipo.using(:restaurant).all
    mantenimiento = DmantenimientoEquipo.using(:dwh_t).new()


    mantenimientos.each do |ma|
      mantenimiento = DmantenimientoEquipo.using(:dwh_t).new()
      mantenimiento.idDetalle = ma.idDetalle
      mantenimiento.FechaInicio = ma.FechaInicio
      mantenimiento.FechaTermino = ma.FechaTermino
      mantenimiento.idEquipoH = ma.idEquipoH
      mantenimiento.idMantenimientoE = ma.idMantenimientoE
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
