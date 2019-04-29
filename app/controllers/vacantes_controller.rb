class VacantesController < ApplicationController
  def index
    initialize_vacantes
    @vacantes = Vacante.using(:dwh_t).where(error: true)
  end

  def edit
    @vacantes = Vacante.using(:dwh_t).find(params[:id])
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

  def initialize_vacantes
    Vacante.using(:dwh_t).delete_all

    vacantes = Vacante.using(:rrhh).all

    vacantes.each do |vacante_r|
      vacante = Vacante.using(:dwh_t).new()
      vacante.id = vacante_r.id
      vacante.nombre = vacante_r.nombre
      vacante.estado = vacante_r.estado
      unless valid_words?(vacante.nombre)
        solicitud.error = true
      end
      unless valid_name?(vacante.estado.to_s)
        solicitud.error = true
      end
      vacante.save!
    end
  end
end
