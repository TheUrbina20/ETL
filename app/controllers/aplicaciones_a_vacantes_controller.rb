class AplicacionesAVacantesController < ApplicationController
  def index
    initialice_aplicaciones
    @aplicaciones = AplicacionAVacante.using(:dwh_t).all
  end

  private

  def initialice_aplicaciones
    AplicacionAVacante.using(:dwh_t).delete_all
    aplicaciones = AplicacionAVacante.using(:rrhh).all

    aplicaciones.each do |aplicacion_r|
      aplicacion = AplicacionAVacante.using(:dwh_t).new()
      aplicacion.id = aplicacion_r.id
      aplicacion.id_postulante = aplicacion_r.id_postulante
      aplicacion.id_vacante = aplicacion_r.id_vacante
      aplicacion.save!
    end
  end
end
