class EquiposPorReciboController < ApplicationController
  def index
    if current_user.admin?
      @equipos_por_recibo = EquipoPorRecibo.using(:dwh_t).where(error: true)
    elsif current_user.hotel?
      @equipos_por_recibo = EquipoPorRecibo.using(:dwh_t).where(sistema: 'H', error: true)
    elsif current_user.rrhh?
      @equipos_por_recibo = EquipoPorRecibo.using(:dwh_t).where(sistema: 'RR', error: true)
    else
      @equipos_por_recibo = EquipoPorRecibo.using(:dwh_t).where(sistema: 'R', error: true)
    end
  end

  def edit
    @equipo_por_recibo = EquipoPorRecibo.using(:dwh_t).find(params[:id])
  end

  def destroy
    @equipo_por_recibo = EquipoPorRecibo.using(:dwh_t).find(params[:id])
    if @equipo_por_recibo.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to equipos_por_recibo_index_path
  end

  def update
    @equipo_por_recibo = EquipoPorRecibo.using(:dwh_t).find(params[:id])
    if validate_attributes && @equipo_por_recibo.update(equipo_por_recibo_params)
      @equipo_por_recibo.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to equipos_por_recibo_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def equipo_por_recibo_params
    params.require(:equipo_por_recibo).permit(:id_sistema, :sistema, :id_equipo, :n_serie, :id_recibo_compra, :f_finalizacion_garantia)
  end

  def validate_attributes
    valid_numserie?(params[:equipo_por_recibo][:n_serie]) && valid_date?(params[:equipo_por_recibo][:f_finalizacion_garantia])
  end
end
