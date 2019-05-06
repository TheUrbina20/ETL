class BajasController < ApplicationController
  def index

    @bajas = Baja.using(:dwh_t).where(error: true)
  end

  def edit
    @baja = Baja.using(:dwh_t).find(params[:id])
  end

  def destroy
    @baja = Baja.using(:dwh_t).find(params[:id])
    if @baja.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to bajas_path
  end

  def update
    @baja = Baja.using(:dwh_t).find(params[:id])
    if validate_attributes && @baja.update(baja_params)
      @baja.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to bajas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def baja_params
    params.require(:baja).permit(:id_artiuclo, :fecha, :tipo, :motivo)
  end

  def validate_attributes
    valid_date?(@baja.fecha)
  end
end
