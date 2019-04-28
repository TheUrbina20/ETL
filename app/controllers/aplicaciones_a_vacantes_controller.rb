class AplicacionesAVacantesController < ApplicationController
  def index
    initialice_aplicaciones
    @aplicaciones = AplicacionAVacante.using(:dwh_t).all
  end

  def edit
    @aplicacion_a_vacante = AplicacionAVacante.using(:dwh_t).find(params[:id])
  end

  def update
    @aplicacion_a_vacante = AplicacionAVacante.using(:dwh_t).find(params[:id])
    if @aplicacion_a_vacante.update(aplicacion_a_vacante_params)
      flash[:notice] = 'Actualizado'
      redirect_to aplicaciones_a_vacantes_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def aplicacion_a_vacante_params
    params.require(:aplicacion_a_vacante).permit(:id_postulante, :id_empleado, :id_vacante, :f_aplicacion)
  end

  def initialice_aplicaciones
    AplicacionAVacante.using(:dwh_t).delete_all
    aplicaciones = AplicacionAVacante.using(:rrhh).all

    aplicaciones.each do |aplicacion_r|
      aplicacion = AplicacionAVacante.using(:dwh_t).new()
      aplicacion.id = aplicacion_r.id
      aplicacion.id_postulante = aplicacion_r.id_postulante
      aplicacion.id_vacante = aplicacion_r.id_vacante
      aplicacion.id_empleado = aplicacion_r.id_empleado
      aplicacion.f_aplicacion = aplicacion_r.f_aplicacion
      aplicacion.save!
    end
  end
end
