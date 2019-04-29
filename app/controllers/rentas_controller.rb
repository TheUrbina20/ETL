class RentasController < ApplicationController
  def index

    @rentas = Renta.using(:dwh_t).where(error: true)
  end

  def edit
    @renta = Renta.using(:dwh_t).find(params[:id])
  end

  def destroy
    @renta = Renta.using(:dwh_t).find(params[:id])
    if @renta.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to rentas_path
  end

  def update
    @renta = Renta.using(:dwh_t).find(params[:id])
    if @renta.update(renta_params)
      flash[:notice] = 'Actualizado'
      redirect_to rentas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def renta_params
    params.require(:renta).permit(:id_cliente, :id_empleado, :f_entrada, :f_salida)
  end

end
