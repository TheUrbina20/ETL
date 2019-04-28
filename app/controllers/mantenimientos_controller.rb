class MantenimientosController < ApplicationController
    def index
        initialize_mantenimientos
        @mantenimientoe = Mantenimiento.using(:dwh_t).all
    end

    def edit
      @mantenimientoe = Mantenimiento.using(:dwh_t).find(params[:id])
    end

    def update
      @mantenimientoe = Mantenimiento.using(:dwh_t).find(params[:id])

      if @mantenimientoe.update(mantenimientos_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to mantenimientos_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def mantenimientos_params
      params.require(:mantenimiento).permit(:id, :tipo)
    end

  private

  def initialize_mantenimientos
    Mantenimiento.using(:dwh_t).delete_all

    mantenimientos = Mantenimiento.using(:restaurant).all
    mantenimiento = Mantenimiento.using(:dwh_t).new()


    mantenimientos.each do |ma|
      mantenimiento = Mantenimiento.using(:dwh_t).new()
      mantenimiento.id = ma.id
      mantenimiento.tipo = ma.tipo
      mantenimiento.save!
    end
  end
end
