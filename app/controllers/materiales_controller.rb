class MaterialesController < ApplicationController
  def index
    if current_user.admin?
      @materiales = Material.using(:dwh_t).where(error: true).order(:nombre)
    elsif current_user.hotel?
      @materiales = Material.using(:dwh_t).where(sistema: 'H', error: true).order(:nombre)
    elsif current_user.rrhh?
      @materiales = Material.using(:dwh_t).where(sistema: 'RR', error: true).order(:nombre)
    else
      @materiales = Material.using(:dwh_t).where(sistema: 'R', error: true).order(:nombre)
    end
  end

  def edit
    @material = Material.using(:dwh_t).find(params[:id])
  end

  def destroy
    @material = Material.using(:dwh_t).find(params[:id])
    if @material.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to materiales_path
  end

  def update
    @material = Material.using(:dwh_t).find(params[:id])
    if @material.update(material_params)
      flash[:notice] = 'Material actualizado'
      redirect_to materiales_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def material_params
    params.require(:material).permit(:id, :nombre, :stock_min, :stock_max, :cantidad_stock, :id_sistema)
  end
end
