class AccidentesLaboralesController < ApplicationController
  def index
    initialize_accidentes
    @accidentes = AccidenteLaboral.using(:dwh_t).where(error: true)
  end

  def edit
    @accidentes = AccidenteLaboral.using(:dwh_t).find(params[:id])
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

  def initialize_accidentes
    AccidenteLaboral.using(:dwh_t).destroy_all

    accidentes = AccidenteLaboral.using(:rrhh).all

    accidentes.each do |accidente_r|
      accidente = AccidenteLaboral.using(:dwh_t).new()
      accidente.id = accidente_r.id
      accidente.id_empleado = accidente_r.id_empleado
      accidente.f_accidente = accidente_r.f_accidente
      unless valid_date?(accidente.f_accidente)
        accidente.error = true
      end
      accidente.save!
    end


  end
end
