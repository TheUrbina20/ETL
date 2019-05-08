class EquiposController < ApplicationController
  def index
    if current_user.admin?
      @equipos = Equipo.using(:dwh_t).where(error: true)
    elsif current_user.hotel?
      @equipos = Equipo.using(:dwh_t).where(sistema: 'H', error: true)
    elsif current_user.rrhh?
      @equipos = Equipo.using(:dwh_t).where(sistema: 'RR', error: true)
    else
      @equipos = Equipo.using(:dwh_t).where(sistema: 'R', error: true)
    end
  end

  def edit
    @equipo = Equipo.using(:dwh_t).find(params[:id])
  end


  def destroy
    @equipo = Equipo.using(:dwh_t).find(params[:id])
    if @equipo.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to equipos_path
  end

  def update
    @equipo = Equipo.using(:dwh_t).find(params[:id])
    if validate_attributes && @equipo.update(equipo_params)
      @equipo.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to equipos_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def delete_with_errors_equipos
    if current_user.hotel?
      Equipo.using(:dwh_t).where(sistema: 'H', error: true).delete_all
    elsif current_user.rrhh?
      Equipo.using(:dwh_t).where(sistema: 'RR', error: true).delete_all
    else
      Equipo.using(:dwh_t).where(sistema: 'R', error: true).delete_all
    end
    redirect_to landing_page_index_path
  end

  def equipo_params
    params.require(:equipo).permit(:id_sistema, :sistema, :nombre, :modelo)
  end

  def validate_attributes
    valid_nombrecosas?(params[:equipo][:nombre])
  end

  private

  def initialize_equipos
    Equipo.using(:dwh_t).delete_all

    equipos = Equipo.using(:rrhh).all
    equipo = Equipo.using(:dwh_t).new

    equipos.each do |equipo_r|
      equipo = Equipo.using(:dwh_t).new

      equipo.id_sistema = equipo_r.id
      equipo.nombre = equipo_r.nombre
      equipo.modelo = equipo_r.modelo
      unless valid_name?(equipo.nombre)
        equipo.error = true
      end

      unless valid_name?(equipo.nombre)
        equipo.error = true
      end

      equipo.sistema = 'RH'
      equipo.save!
    end

    equipos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Equipo']

    equipos.each do |equipo_r|
      equipo = Equipo.using(:dwh_t).new()

      equipo.id_sistema = equipo_r[:Id]
      equipo.nombre = equipo_r[:nombre]
      equipo.sistema = 'R'
      equipo.error = true
      equipo.save!
    end

    equipos = Equipo.using(:restaurant).all
    equipo = Equipo.using(:dwh_t).new

    equipos.each do |equipo_r|
      equipo = Equipo.using(:dwh_t).new

      equipo.id_sistema = equipo_r.idEquipo
      equipo.nombre = equipo_r.Nombre
      equipo.error = true
      equipo.sistema = 'H'
      equipo.save!
    end
  end
end
