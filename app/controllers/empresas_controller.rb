class EmpresasController < ApplicationController
  def index
    initialice_empresas
    @empresas = Empresa.using(:dwh_t).all
  end

  private

  def initialice_empresas
    Empresa.using(:dwh_t).destroy_all

    empresas = Empresa.using(:rrhh).all

    empresas.each do |empresa_r|
      empresa = Empresa.using(:dwh_t).new()

      empresa.id = empresa_r.id
      empresa.nombre = empresa_r.nombre
      empresa.save!
    end
  end
end
