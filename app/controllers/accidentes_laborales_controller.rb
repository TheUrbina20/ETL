class AccidentesLaboralesController < ApplicationController
  def index
    initialize_accidentes
    @accidentes = AccidenteLaboral.using(:dwh_t).all
  end

  private

  def initialize_accidentes
    AccidenteLaboral.using(:dwh_t).destroy_all

    accidentes = AccidenteLaboral.using(:rrhh).all

    accidentes.each do |accidente_r|
      accidente = AccidenteLaboral.using(:dwh_t).new()
      accidente.id = accidente_r.id
      accidente.id_empleado = accidente_r.id_empleado
      accidente.f_accidente = accidente_r.f_accidente
      accidente.save!
    end


  end
end
