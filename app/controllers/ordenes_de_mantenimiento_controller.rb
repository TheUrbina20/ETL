class OrdenesDeMantenimientoController < ApplicationController
  def index

    if current_user.admin?
      @mantenimientos_por_equipo = MantenimientoPorEquipo.using(:dwh_t).where(error: true)
    elsif current_user.hotel?
      @mantenimientos_por_equipo = MantenimientoPorEquipo.using(:dwh_t).where(sistema: 'H', error: true)
    elsif current_user.rrhh?
      @mantenimientos_por_equipo = MantenimientoPorEquipo.using(:dwh_t).where(sistema: 'RR', error: true)
    else
      @mantenimientos_por_equipo = MantenimientoPorEquipo.using(:dwh_t).where(sistema: 'R', error: true)
    end
  end

  def edit
    @mantenimiento_por_equipo = MantenimientoPorEquipo.using(:dwh_t).find(params[:id])
  end

  def destroy
    @mantenimiento_por_equipo = MantenimientoPorEquipo.using(:dwh_t).find(params[:id])
    if @mantenimiento_por_equipo.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to ordenes_de_mantenimiento_index_path
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

end
