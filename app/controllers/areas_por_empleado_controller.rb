class AreasPorEmpleadoController < ApplicationController
  def index
    initialize_areas_por_empleado
    @areas_por_empleado = AreasPorEmpleado.using(:dwh_t).all
  end

  private

  def initialize_areas_por_empleado
    AreasPorEmpleado.using(:dwh_t).delete_all

    areas = AreasPorEmpleado.using(:rrhh).all

    areas.each do |area_r|
      area = AreasPorEmpleado.using(:dwh_t).new()

      area.id = area_r.id
      area.id_area = area_r.id_area
      area.id_empleado = area_r.id_empleado
      area.f_asignacion = area_r.f_asignacion
      area.save!
    end
  end
end
