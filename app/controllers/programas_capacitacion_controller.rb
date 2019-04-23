class ProgramasCapacitacionController < ApplicationController
  def index
    initialice_programas
    @programas = ProgramaCapacitacion.using(:dwh_t).all
  end

  private

  def initialice_programas
    ProgramaCapacitacion.using(:dwh_t).destroy_all
    programas = ProgramaCapacitacion.using(:rrhh).all

    programas.each do |programa_r|
      programa = ProgramaCapacitacion.using(:dwh_t).new()

      programa.id = programa_r.id
      programa.id_empresa = programa_r.id_empresa
      programa.nombre = programa_r.nombre
      programa.costo = programa_r.costo
      programa.duracion = programa_r.duracion
      programa.save!
    end

  end
end
