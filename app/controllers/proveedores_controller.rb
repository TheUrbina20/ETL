class ProveedoresController < ApplicationController
  def index

    @proveedores = Proveedor.using(:dwh_t).where(error: true)
  end

  def edit
    @proveedor = Proveedor.using(:dwh_t).find(params[:id])
  end

  def update
    @proveedor = Proveedor.using(:dwh_t).find(params[:id])
    if @proveedor.update(proveedor_params)
      flash[:notice] = 'Actualizado'
      redirect_to proveedores_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def proveedor_params
    params.require(:proveedor).permit(:id_sistema, :nombre, :sistema, :id_empresa)
  end

  private


end
