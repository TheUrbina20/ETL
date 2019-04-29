class BebidasPorComandaController < ApplicationController
  def index
    @bebidas = BebidaPorComanda.using(:dwh_t).where(error: true)
  end

  def edit
    @bebida_por_comanda = BebidaPorComanda.using(:dwh_t).find(params[:id])
  end

  def destroy
    @bebida_por_comanda = BebidaPorComanda.using(:dwh_t).find(params[:id])
    if @bebida_por_comanda.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to bebidas_por_comanda_index_path
  end

  def update
    @bebida_por_comanda = BebidaPorComanda.using(:dwh_t).find(params[:id])
    if @bebida_por_comanda.update(bebida_por_comanda_params)
      flash[:notice] = 'Actualizado'
      redirect_to bebidas_por_comanda_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def bebida_por_comanda_params
    params.require(:bebida_por_comanda).permit(:id_comanda, :id_bebida, :cantidad)
  end

  private


end
