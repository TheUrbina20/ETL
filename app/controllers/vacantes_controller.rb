class VacantesController < ApplicationController
  def index
    initialize_vacantes
    @vacantes = Vacante.using(:dwh_t).all
  end

  private

  def initialize_vacantes
    Vacante.using(:dwh_t).delete_all

    vacantes = Vacante.using(:rrhh).all

    vacantes.each do |vacante_r|
      vacante = Vacante.using(:dwh_t).new()

      vacante.nombre = vacante_r.nombre
      vacante.estado = vacante_r.estado
      vacante.save!
    end
  end
end
