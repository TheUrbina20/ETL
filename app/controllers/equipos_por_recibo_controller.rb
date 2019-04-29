class EquiposPorReciboController < ApplicationController
  def index
    initialize_equipos_por_recibo
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

  def update
    @equipo_por_recibo = EquipoPorRecibo.using(:dwh_t).find(params[:id])
    if @equipo_por_recibo.update(equipo_por_recibo_params)
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

  def initialize_equipos_por_recibo
    EquipoPorRecibo.using(:dwh_t).delete_all

    equipos_por_recibo = EquipoPorRecibo.using(:rrhh).all
    equipo_por_recibo = EquipoPorRecibo.using(:dwh_t).new

    equipos_por_recibo.each do |equipo_por_recibio_r|
      equipo_por_recibo = EquipoPorRecibo.using(:dwh_t).new

      equipo_por_recibo.id_sistema = equipo_por_recibio_r.id
      equipo_por_recibo.id_equipo = equipo_por_recibio_r.id_equipo
      equipo_por_recibo.id_recibo_compra = equipo_por_recibio_r.id_recibo_compra
      equipo_por_recibo.n_serie = equipo_por_recibio_r.n_serie
      equipo_por_recibo.f_finalizacion_garantia = equipo_por_recibio_r.f_finalizacion_garantia
      unless valid_name?(equipo_por_recibo.n_serie)
        equipo_por_recibo.error = true
      end

      unless valid_date?(equipo_por_recibo.f_finalizacion_garantia)
        equipo_por_recibo.error = true
      end
      equipo_por_recibo.sistema = 'RR'
      equipo_por_recibo.save!
    end

    equipos_por_recibo =Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_equipo_recibo']

    equipos_por_recibo.each do |equipo_por_recibo_r|
      equipo_por_recibo = EquipoPorRecibo.using(:dwh_t).new

      equipo_por_recibo.id_sistema = equipo_por_recibo_r[:Id]
      equipo_por_recibo.id_equipo = equipo_por_recibo_r[:id_equipo_c]
      equipo_por_recibo.id_recibo_compra = equipo_por_recibo_r[:id_rec_rm]
      equipo_por_recibo.sistema = 'R'
      equipo_por_recibo.error = true
      equipo_por_recibo.save!
    end

  end
end
