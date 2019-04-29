class MesasController < ApplicationController
  def index

    @mesas = Mesa.using(:dwh_t).where(error: true)
  end

  def edit
    @mesa = Mesa.using(:dwh_t).find(params[:id])
  end

  def destroy
    @mesa = Mesa.using(:dwh_t).find(params[:id])
    if @mesa.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to mesas_path
  end

  def update
    @mesa = Mesa.using(:dwh_t).find(params[:id])
    if @mesa.update(mesa_params)
      flash[:notice] = 'Actualizado'
      redirect_to mesas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def mesa_params
    params.require(:mesa).permit(:numero, :capacidad)
  end
end
