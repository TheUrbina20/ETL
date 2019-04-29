class EmpresasController < ApplicationController
  def index
    initialice_empresas
    @empresas = Empresa.using(:dwh_t).all
  end

  def edit
    @empresa = Empresa.using(:dwh_t).find(params[:id])
  end

  def update
    @empresa = Empresa.using(:dwh_t).find(params[:id])

    if @empresa.update(empresa_attributes)
      flash[:notice] = 'Actualizado'
      redirect_to empresas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  private

  def empresa_attributes
    params.require(:empresa).permit(:nombre)
  end

  def initialice_empresas
    Empresa.using(:dwh_t).destroy_all

    empresas = Empresa.using(:rrhh).all

    empresas.each do |empresa_r|
      empresa = Empresa.using(:dwh_t).new()

      empresa.id = empresa_r.id
      empresa.nombre = empresa_r.nombre
      unless valid_name?(empresa.nombre)
        empresa.error = true
      end
      empresa.save!
    end
  end
end
