class OrdenesDeMantenimientoController < ApplicationController
  def index
    initialize_mantenimientos_por_equipo
    if current_user.admin?
      @mantenimientos_por_equipo = MantenimientoPorEquipo.using(:dwh_t).all
    elsif current_user.hotel?
      @mantenimientos_por_equipo = MantenimientoPorEquipo.using(:dwh_t).where(sistema: 'H')
    elsif current_user.rrhh?
      @mantenimientos_por_equipo = MantenimientoPorEquipo.using(:dwh_t).where(sistema: 'RR')
    else
      @mantenimientos_por_equipo = MantenimientoPorEquipo.using(:dwh_t).where(sistema: 'R')
    end
  end

  def edit
    @mantenimiento_por_equipo = MantenimientoPorEquipo.using(:dwh_t).find(params[:id])
  end

  def update
    @mantenimiento_por_equipo = MantenimientoPorEquipo.using(:dwh_t).find(params[:id])
    if @mantenimiento_por_equipo.update(orden_de_mantenimiento_params)
      flash[:notice] = 'Actualizado'
      redirect_to ordenes_de_mantenimiento_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def orden_de_mantenimiento_params
    params.require(:mantenimiento_por_equipo).permit(:id_sistema, :f_inicio, :f_termino, :id_equipo, :tipo_mantenimiento, :id_empleado)
  end

  def initialize_mantenimientos_por_equipo
    MantenimientoPorEquipo.using(:dwh_t).delete_all

    mantenimientos = MantenimientoPorEquipo.using(:restaurant).all
    mantenimiento = MantenimientoPorEquipo.using(:dwh_t).new

    mantenimientos.each do |mantenimiento_r|
      mantenimiento = MantenimientoPorEquipo.using(:dwh_t).new
      mantenimiento.id_sistema = mantenimiento_r.id
      mantenimiento.f_inicio = mantenimiento_r.FechaInicio
      mantenimiento.f_termino = mantenimiento_r.FechaTermino
      mantenimiento.id_equipo = mantenimiento_r.idEquipo_recibo
      mantenimiento.tipo_mantenimiento = mantenimiento_r.tipo_mantenimiento
      mantenimiento.id_empleado = mantenimiento_r.idEmpleado
      mantenimiento.sistema = 'H'
      mantenimiento.save!
    end

    mantenimientos = MantenimientoPorEquipo.using(:rrhh).all

    mantenimientos.each do |mantenimiento_r|
      mantenimiento = MantenimientoPorEquipo.using(:dwh_t).new
      mantenimiento.id_sistema = mantenimiento_r.id
      mantenimiento.f_inicio = mantenimiento_r.f_solicitud
      mantenimiento.f_termino = mantenimiento_r.f_recibo
      mantenimiento.estado = mantenimiento_r.estado
      mantenimiento.id_equipo = mantenimiento_r.id_equipo_por_recibo
      mantenimiento.tipo_mantenimiento = mantenimiento_r.tipo
      mantenimiento.id_empleado = mantenimiento_r.id_empleado
      mantenimiento.sistema = 'RR'
      mantenimiento.save!
    end

    mantenimientos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_correccion_mantenimiento']

    mantenimientos.each do |mantenimiento_r|
      mantenimiento = MantenimientoPorEquipo.using(:dwh_t).new
      mantenimiento.id_sistema = mantenimiento_r[:ID]
      mantenimiento.f_inicio = mantenimiento_r[:fecha]
      mantenimiento.id_equipo = mantenimiento_r[:id_equipo_c]
      mantenimiento.tipo_mantenimiento = mantenimiento_r[:Id_cor_mant]
      mantenimiento.sistema = 'R'
      mantenimiento.save!
    end

  end
end
