class SolicitudesDeMantenimientoController < ApplicationController
  def index
    initialice_solicitudes
    @solicitudes = SolicitudMantenimiento.using(:dwh_t).where(error: true)
  end

  def edit
    @solicitud_mantenimiento = SolicitudMantenimiento.using(:dwh_t).find(params[:id])
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

  def initialice_solicitudes
    SolicitudMantenimiento.using(:dwh_t).delete_all

    solicitudes = SolicitudMantenimiento.using(:rrhh).all

    solicitudes.each do |solicitud_r|
      solicitud = SolicitudMantenimiento.using(:dwh_t).new()

      solicitud.id = solicitud_r.id
      solicitud.id_empleado = solicitud_r.id_empleado
      solicitud.id_equipo_por_recibo = solicitud.id_equipo_por_recibo
      solicitud.f_solicitud = solicitud_r.f_solicitud
      solicitud.f_recibo =solicitud_r.f_recibo
      solicitud.estado = solicitud_r.estado
      solicitud.motivo = solicitud_r.estado
      solicitud.tipo = solicitud_r.tipo
      unless valid_date?(solicitud.f_solicitud)
        solicitud.error = true
      end
      unless valid_date?(solicitud.f_recibo)
        solicitud.error = true
      end
      unless valid_name?(solicitud.estado)
        solicitud.error = true
      end
      unless valid_name?(solicitud.motivo)
        solicitud.error = true
      end
      solicitud.save!
    end
  end
end
