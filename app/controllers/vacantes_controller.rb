class VacantesController < ApplicationController
  def index
    @vacantes = Vacante.using(:dwh_t).where(error: true)
  end

  def edit
    @vacantes = Vacante.using(:dwh_t).find(params[:id])
  end

  def destroy
    @vacantes = Vacante.using(:dwh_t).find(params[:id])
    if @vacantes.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to vacantes_path
  end

  def update
    @vacantes = Vacante.using(:dwh_t).find(params[:id])

    if @vacantes.update(vacantes_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to vacantes_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def vacantes_params
    params.require(:vacante).permit(:id, :nombre, :estado)
  end
  private

end
