class CapacitacionesPorEmpleadoController < ApplicationController
  def index
    initialice_capacitaciones
    @capacitaciones = CapacitacionPorEmpleado.using(:dwh_t).all
  end

  private

  def initialice_capacitaciones
    CapacitacionPorEmpleado.using(:dwh_t).destroy_all
    capacitaciones = CapacitacionPorEmpleado.using(:rrhh).all

    capacitaciones.each do |capacitacion_r|
      capacitacion = CapacitacionPorEmpleado.using(:dwh_t).new()

      capacitacion.id = capacitacion_r.id
      capacitacion.id_programa = capacitacion_r.id_programa
      capacitacion.id_empleado = capacitacion_r.id_empleado
      capacitacion.f_inicio = capacitacion_r.f_inicio
      capacitacion.f_fin = capacitacion_r.f_fin
      capacitacion.estado = capacitacion_r.estado
      capacitacion.save!
    end

  end
end
