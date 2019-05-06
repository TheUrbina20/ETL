class ProgramasCapacitacionController < ApplicationController
  def index

    @programas = ProgramaCapacitacion.using(:dwh_t).where(error: true)
  end

  def edit
    @programas = ProgramaCapacitacion.using(:dwh_t).find(params[:id])
  end

  def destroy
    @programas = ProgramaCapacitacion.using(:dwh_t).find(params[:id])
    if @programas.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to programas_capacitacion_index_path
  end

  def update
    @programas = ProgramaCapacitacion.using(:dwh_t).find(params[:id])
    if validate_attributes && @programas.update(programas_params)
      @programas.update_attributes(error: false)
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

  def validate_attributes
    valid_price?(params[:programa_capacitacion][:costo]) && valid_number?(params[:programa_capacitacion][:duracion]) && valid_nombrecosas?(params[:programa_capacitacion][:nombre])
  end

end
