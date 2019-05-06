class EmpresasController < ApplicationController
  def index
    @empresas = Empresa.using(:dwh_t).where(error: true)
  end

  def edit
    @empresa = Empresa.using(:dwh_t).find(params[:id])
  end

  def destroy
    @empresa = Empresa.using(:dwh_t).find(params[:id])
    if @empresa.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to empresas_path
  end

  def update
    @empresa = Empresa.using(:dwh_t).find(params[:id])
    if validate_attributes && @empresa.update(empresa_attributes)
      @empresa.update_attributes(error: false)
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

  def validate_attributes
    valid_nombrecosas?(@empresa.nombre)
  end
end
