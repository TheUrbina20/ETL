class BebidasController < ApplicationController
  def index
    @bebidas = Bebida.using(:dwh_t).where(error: true)
  end

  def edit
    @bebida = Bebida.using(:dwh_t).find(params[:id])
  end

  def destroy
    @bebida = Bebida.using(:dwh_t).find(params[:id])
    if @bebida.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to bebidas_path
  end


  def update
    @bebida = Bebida.using(:dwh_t).find(params[:id])
    if @bebida.update(bebida_params)
      flash[:notice] = 'Actualizado'
      redirect_to bebidas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def bebida_params
    params.require(:bebida).permit(:nombre, :precio, :descripcion)
  end
end
