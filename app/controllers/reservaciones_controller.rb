class ReservacionesController < ApplicationController
    def index
        @reservaciones = Reservacion.using(:dwh_t).where(error: true)
    end

    def edit
      @reservaciones = Reservacion.using(:dwh_t).find(params[:id])
    end

    def destroy
      @reservaciones = Reservacion.using(:dwh_t).find(params[:id])
      if @reservaciones.destroy
        flash[:notice] = 'Eliminado'
      else
        flash[:alert] = 'Error eliminando'
      end
      redirect_to reservaciones_path
    end

    def update
      @reservaciones = Reservacion.using(:dwh_t).find(params[:id])
      if @reservaciones.update(reservaciones_params)
        @reservaciones.update_attributes(error: false)
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
