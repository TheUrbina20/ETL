class ComandasController < ApplicationController
  def index

    @comandas = Comanda.using(:dwh_t).where(error: true)
  end

  def edit
    @comanda = Comanda.using(:dwh_t).find(params[:id])
  end

  def destroy
    @comanda = Comanda.using(:dwh_t).find(params[:id])
    if @comanda.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to comandas_path
  end

  def update
    @comanda = Comanda.using(:dwh_t).find(params[:id])
    if validate_attributes && @comanda.update(comanda_params)
      @comanda.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to comandas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def comanda_params
    params.require(:comanda).permit(:id_reservacion, :id_empleado, :fecha, :hora_reservacion)
  end

  def validate_attributes
    valid_date?(params[:comanda][:fecha])
  end

end
