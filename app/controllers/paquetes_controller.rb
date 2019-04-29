class PaquetesController < ApplicationController
  def index
    @paquete = Paquete.using(:dwh_t).where(error: true)
  end

  def edit
    @paquete = Paquete.using(:dwh_t).find(params[:id])
  end

  def update
    @paquete = Paquete.using(:dwh_t).find(params[:id])

    if @paquete.update(paquetes_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to paquetes_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def paquetes_params
    params.require(:paquete).permit(:id, :nombre, :descripcion, :precio_por_dia)
  end
end
