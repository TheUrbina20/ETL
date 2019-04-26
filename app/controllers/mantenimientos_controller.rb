class MantenimientosController < ApplicationController
    def index
        initialize_mantenimientoe
        @mantenimientoe = MantenimientoEquipo.using(:dwh_t).all
    end

  private

  def initialize_mantenimientoe
    MantenimientoEquipo.using(:dwh_t).delete_all

    mantenimientos = MantenimientoEquipo.using(:restaurant).all
    mantenimiento = MantenimientoEquipo.using(:dwh_t).new()


    mantenimientos.each do |ma|
      mantenimiento = MantenimientoEquipo.using(:dwh_t).new()
      mantenimiento.idMantenimiento = ma.idMatenimiento	
      mantenimiento.Tipo = ma.Tipo
      mantenimiento.save!
    end
  end
end
