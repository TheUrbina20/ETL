class BajasController < ApplicationController
  def index
    initialize_bajas
    @bajas = Baja.using(:dwh_t).all
  end

  private

  def initialize_bajas
    Baja.using(:dwh_t).delete_all

    bajas = Baja.using(:rrhh).all

    bajas.each do |baja_r|
      baja = Baja.using(:dwh_t).new()
      baja. id = baja_r.id
      baja.id_articulo = baja_r.id_articulo
      baja.tipo = baja_r.tipo
      baja.fecha = baja_r.fecha
      baja.motivo = baja_r.motivo
      baja.save!
    end
  end
end
