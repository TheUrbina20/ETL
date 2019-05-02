class AplicacionesAVacantesController < ApplicationController
  def index
    @aplicaciones = AplicacionAVacante.using(:dwh_t).where(error: true)
  end

  def edit
    @aplicacion_a_vacante = AplicacionAVacante.using(:dwh_t).find(params[:id])
  end

  def destroy
    @aplicacion_a_vacante = AplicacionAVacante.using(:dwh_t).find(params[:id])
    if @aplicacion_a_vacante.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to aplicaciones_a_vacantes_path
  end


  def update
    @aplicacion_a_vacante = AplicacionAVacante.using(:dwh_t).find(params[:id])
    @aplicacion_a_vacante.update(aplicacion_a_vacante_params)
    if validate_attributes
      @aplicacion_a_vacante.update_attributes(error: false)
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

  def validate_attributes 
    valid_date?(@aplicacion_a_vacante.f_aplicacion)
  end
end
