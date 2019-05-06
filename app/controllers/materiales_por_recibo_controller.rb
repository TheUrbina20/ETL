class MaterialesPorReciboController < ApplicationController
  def index

    if current_user.admin?
      @materiales_por_recibo = MaterialPorRecibo.using(:dwh_t).where(error: true)
    elsif current_user.hotel?
      @materiales_por_recibo = MaterialPorRecibo.using(:dwh_t).where(sistema: 'H', error: true)
    elsif current_user.rrhh?
      @materiales_por_recibo = MaterialPorRecibo.using(:dwh_t).where(sistema: 'RR', error: true)
    else
      @materiales_por_recibo = MaterialPorRecibo.using(:dwh_t).where(sistema: 'R', error: true)
    end

  end

  def edit
    @material_por_recibo = MaterialPorRecibo.using(:dwh_t).find(params[:id])
  end

  def destroy
    @material_por_recibo = MaterialPorRecibo.using(:dwh_t).find(params[:id])
    if @material_por_recibo.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to materiales_por_recibo_index_path
  end

  def update
    @material_por_recibo = MaterialPorRecibo.using(:dwh_t).find(params[:id])
    if validate_attributes && @material_por_recibo.update(material_por_recibo_params)
      @material_por_recibo.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to materiales_por_recibo_index_path
    else
      flash.now[:alert] = 'Actualizado'
      render 'edit'
    end
  end

  def material_por_recibo_params
    params.require(:material_por_recibo).permit(:id_sistema, :sistema, :id_material, :id_recibo, :cantidad, :tipo_paquete, :f_caducidad)
  end

  def validate_attributes
    valid_number?(params[:material_por_recibo][:cantidad]) && valid_date?(parmas[:material_por_recibo][:f_caducidad])
  end


end
