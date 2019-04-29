class AccidentesLaboralesController < ApplicationController
  def index
    @accidentes = AccidenteLaboral.using(:dwh_t).where(error: true)
  end

  def edit
    @accidentes = AccidenteLaboral.using(:dwh_t).find(params[:id])
  end

  def destroy
    @accidentes = AccidenteLaboral.using(:dwh_t).find(params[:id])
    if @accidentes.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to accidentes_laborales_path
  end

  def update
    @accidentes = AccidenteLaboral.using(:dwh_t).find(params[:id])

    if @accidentes.update(accidentes_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to accidentes_laborales_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def accidentes_params
    params.require(:accidente_laboral).permit(:id, :id_empleado, :f_accidente, :Descripcion)
  end

  private

end
