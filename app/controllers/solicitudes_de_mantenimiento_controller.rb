class SolicitudesDeMantenimientoController < ApplicationController
  def index

    @solicitudes = SolicitudMantenimiento.using(:dwh_t).where(error: true)
  end

  def edit
    @solicitud_mantenimiento = SolicitudMantenimiento.using(:dwh_t).find(params[:id])
  end

  def destroy
    @solicitud_mantenimiento = SolicitudMantenimiento.using(:dwh_t).find(params[:id])
    if @solicitud_mantenimiento.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to solicitudes_de_mantenimiento_index_path
  end

  def update
    @solicitud_mantenimiento = SolicitudMantenimiento.using(:dwh_t).find(params[:id])
    if @solicitud_mantenimiento.update(solicitud_mantenimiento_params)
      flash[:notice] = 'Actualizado'
      redirect_to solicitudes_de_mantenimiento_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def solicitud_mantenimiento_params
    params.require(:solicitud_mantenimiento).permit(:id_empleado, :id_equipos_por_recibo, :f_solicitud, :f_recibo, :estado, :motivo, :tipo)
  end

  private

end
