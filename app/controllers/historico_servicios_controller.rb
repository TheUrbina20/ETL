class HistoricoServiciosController < ApplicationController
  def index
      @historicos = HistoricoServicio.using(:dwh_t).where(error: true)
  end

  def edit
    @historicos = HistoricoServicio.using(:dwh_t).find(params[:id])
  end

  def destroy
    @historicos = HistoricoServicio.using(:dwh_t).find(params[:id])
    if @historicos.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to historico_servicios_path
  end

  def update
    @historicos = HistoricoServicio.using(:dwh_t).find(params[:id])
    @historicos.update(hservicios_params)
    if validate_attributes
      @historicos.update_attributes(error: false)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to historico_servicios_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def hservicios_params
    params.require(:historico_servicio).permit(:id,:precio, :f_inicio, :f_termino, :id_servicio)
  end

  def validate_attributes
    valid_date?(@historicos.f_inicio) && valid_price?(@historicos.precio)
  end
end
