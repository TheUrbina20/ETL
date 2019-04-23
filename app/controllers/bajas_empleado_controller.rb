class BajasEmpleadoController < ApplicationController
  def index
    initiallize_bajas_empleados
    @bajas_por_empleado = BajaEmpleado.using(:dwh_t).all
  end

  private

  def initiallize_bajas_empleados
    BajaEmpleado.using(:dwh_t).delete_all

    bajas = BajaEmpleado.using(:rrhh).all

    bajas.each do |baja_r|
      baja = BajaEmpleado.using(:dwh_t).new()

      baja.id = baja_r.id
      baja.motivo = baja_r.motivo
      baja.save!
    end

  end
end
