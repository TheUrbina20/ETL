class ProgramasCapacitacionController < ApplicationController
  def index
    initialice_programas
    @programas = ProgramaCapacitacion.using(:dwh_t).all
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

  def initialice_programas
    ProgramaCapacitacion.using(:dwh_t).destroy_all
    programas = ProgramaCapacitacion.using(:rrhh).all

    programas.each do |programa_r|
      programa = ProgramaCapacitacion.using(:dwh_t).new()

      programa.id = programa_r.id
      programa.id_empresa = programa_r.id_empresa
      programa.nombre = programa_r.nombre
      programa.costo = programa_r.costo
      programa.duracion = programa_r.duracion
      programa.save!
    end

  end
end
