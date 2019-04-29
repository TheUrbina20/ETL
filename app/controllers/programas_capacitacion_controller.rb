class ProgramasCapacitacionController < ApplicationController
  def index

    @programas = ProgramaCapacitacion.using(:dwh_t).where(error: true)
  end

  def edit
    @programas = ProgramaCapacitacion.using(:dwh_t).find(params[:id])
  end

  def update
    @programas = ProgramaCapacitacion.using(:dwh_t).find(params[:id])

    if @programas.update(programas_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to programas_capacitacion_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def programas_params
    params.require(:programa_capacitacion).permit(:id, :id_empresa, :nombre, :costo, :duracion)
  end

  private

end
