class PlatillosPorComandaController < ApplicationController
  def index

    @platillos_por_comanda = PlatilloPorComanda.using(:dwh_t).where(error: true)
  end

  def edit
    @platillo_por_comanda = PlatilloPorComanda.using(:dwh_t).find(params[:id])
  end

  def destroy
    @platillo_por_comanda = PlatilloPorComanda.using(:dwh_t).find(params[:id])
    if @platillo_por_comanda.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to platillos_por_comanda_index_path
  end

  def update
    @platillo_por_comanda = PlatilloPorComanda.using(:dwh_t).find(params[:id])
    if @platillo_por_comanda.update(platillo_por_comanda_params)
      flash[:notice] = 'Actualizado'
      redirect_to platillos_por_comanda_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def platillo_por_comanda_params
    params.require(:platillo_por_comanda).permit(:id_comanda, :id_platillo, :cantidad)
  end
end
