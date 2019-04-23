class AsistenciasController < ApplicationController
  def index
    initialize_asistencias
    @asistencias = Asistencia.using(:dwh_t).all
  end

  private

  def initialize_asistencias
    Asistencia.using(:dwh_t).destroy_all

    asistencias = Asistencia.using(:rrhh).all

    asistencias.each do |asistencia_r|
      asistencia = Asistencia.using(:dwh_t).new()

      asistencia.id = asistencia_r.id
      asistencia.id_empleado = asistencia_r.id_empleado
      asistencia.fecha = asistencia_r.fecha
      asistencia.hora_entrada = asistencia_r.h_entrada
      asistencia.hora_salida = asistencia_r.h_salida
      asistencia.save!
    end
  end
end
