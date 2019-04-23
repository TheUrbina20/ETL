class SolicitudesDeMantenimientoController < ApplicationController
  def index
    initialice_solicitudes
    @solicitudes = SolicitudMantenimiento.using(:dwh_t).all
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
      solicitud.save!
    end
  end
end
