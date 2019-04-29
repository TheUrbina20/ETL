class ReservacionesEnRestauranteController < ApplicationController
  def index

    @reservaciones_en_restaurante = ReservacionEnRestaurante.using(:dwh_t).where(error: true)
  end

  def edit
    @reservacion_en_restaurante = ReservacionEnRestaurante.using(:dwh_t).find(params[:id])
  end

  def update
    @reservacion_en_restaurante = ReservacionEnRestaurante.using(:dwh_t).find(params[:id])
    if @reservacion_en_restaurante.update(reservacion_restaurante_params)
      flash[:notice] = 'Actualizado'
      redirect_to reservaciones_en_restaurante_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def reservacion_restaurante_params
    params.require(:reservacion_en_restaurante).permit(:f_reservacion, :hora, :idcliente, :id_empleado)
  end

end
