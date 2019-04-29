class ReservacionesController < ApplicationController
    def index

        @reservaciones = Reservacion.using(:dwh_t).where(error: true)
    end
    def edit
      @reservaciones = Reservacion.using(:dwh_t).find(params[:id])
    end

    def update
      @reservaciones = Reservacion.using(:dwh_t).find(params[:id])

      if @reservaciones.update(reservaciones_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to reservaciones_path
      else
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def reservaciones_params
      params.require(:reservacion).permit(:id, :f_entrada, :f_falida, :f_reservacion, :estado, :id_cliente, :id_empleado)
    end

  private

end
