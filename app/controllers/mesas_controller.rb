class MesasController < ApplicationController
  def index
    initialize_mesas
    @mesas = Mesa.using(:dwh_t).all
  end

  private

  def initialize_mesas
    Mesa.using(:dwh_t).delete_all
    mesas = empleados_rest = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Mesa']
    mesa = Mesa.using(:dwh_t).new()
    mesas.each do |mesa_r|
      mesa = Mesa.using(:dwh_t).new()
      mesa.id = mesa_r[:id]
      mesa.numero = mesa_r[:numero]
      mesa.capacidad = mesa_r[:capacidad]
      mesa.save!
    end
  end
end
