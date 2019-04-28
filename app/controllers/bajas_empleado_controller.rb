class BajasEmpleadoController < ApplicationController
  def index
    initiallize_bajas_empleados
    @bajas_por_empleado = BajaEmpleado.using(:dwh_t).all
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

  def initiallize_bajas_empleados
    BajaEmpleado.using(:dwh_t).delete_all

    bajas = BajaEmpleado.using(:rrhh).all

    bajas.each do |baja_r|
      baja = BajaEmpleado.using(:dwh_t).new()

      baja.id = baja_r.id
      baja.id_empleado = baja_r.id_empleado
      baja.motivo = baja_r.motivo
      baja.save!
    end

  end
end
