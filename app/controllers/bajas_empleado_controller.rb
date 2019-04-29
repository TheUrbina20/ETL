class BajasEmpleadoController < ApplicationController
  def index

    @bajas_por_empleado = BajaEmpleado.using(:dwh_t).where(error: true)
  end

  def edit
    @baja_empleado =  BajaEmpleado.using(:dwh_t).find(params[:id])
  end

  def update
    @baja_empleado =  BajaEmpleado.using(:dwh_t).find(params[:id])
    if @baja_empleado.update(baja_empleado_params)
      flash[:notice] = 'Actualizado'
      redirect_to bajas_empleado_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def baja_empleado_params
    params.require(:baja_empleado).permit(:id_empleado, :motivo)
  end

end
