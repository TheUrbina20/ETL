class BajasEmpleadoController < ApplicationController
  def index

    @bajas_por_empleado = BajaEmpleado.using(:dwh_t).where(error: true)
  end

  def edit
    @baja_empleado =  BajaEmpleado.using(:dwh_t).find(params[:id])
  end

  def destroy
    @baja_empleado =  BajaEmpleado.using(:dwh_t).find(params[:id])
    if @baja_empleado.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to asistencias_path
  end

  def update
    @baja_empleado =  BajaEmpleado.using(:dwh_t).find(params[:id])
    if validate_attributes && @baja_empleado.update(baja_empleado_params)
      @baja_empleado.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to bajas_empleado_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def baja_empleado_params
    params.require(:baja_empleado).permit(:id, :id_empleado, :motivo, :fecha)
  end

  def validate_attributes
    valid_date?(params[:baja_empleado][:fecha])
  end

end
