class PaquetesController < ApplicationController
  def index
    @paquete = Paquete.using(:dwh_t).where(error: true)
  end

  def edit
    @paquete = Paquete.using(:dwh_t).find(params[:id])
  end

  def destroy
    @paquete = Paquete.using(:dwh_t).find(params[:id])
    if @paquete.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to paquetes_path
  end

  def update
    @paquete = Paquete.using(:dwh_t).find(params[:id])
    if validate_attributes && @paquete.update(paquetes_params)
      @paquete.update_attributes(error: false)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to paquetes_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def delete_with_errors_paquetes
    Paquete.using(:dwh_t).where(error: true).delete_all
    redirect_to landing_page_index_path
  end 

  def paquetes_params
    params.require(:paquete).permit(:id, :nombre, :descripcion, :precio_por_dia)
  end

  def validate_attributes
    valid_price?(params[:paquete][:precio_por_dia]) && valid_nombrecosas?(params[:paquete][:nombre])
  end
end
