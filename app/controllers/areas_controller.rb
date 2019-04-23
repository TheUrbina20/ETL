class AreasController < ApplicationController
  def index
    initialize_areas
    @areas = Area.using(:dwh_t).all
  end

  private

  def initialize_areas
    Area.using(:dwh_t).delete_all

    areas = Area.using(:rrhh).all

    areas.each do |area_r|
      area = Area.using(:dwh_t).new()

      area.id = area_r.id
      area.nombre = area_r.nombre
      area.save!
    end
  end
end
