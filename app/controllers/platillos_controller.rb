class PlatillosController < ApplicationController
  def index
    initialize_platillo
    @platillos = Platillo.using(:dwh_t).all
  end

  def initialize_platillo
    Platillo.using(:dwh_t).delete_all

    platillos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Platillos']

    platillos.each do |platillo_r|
      platillo = Platillo.using(:dwh_t).new

      platillo.id = platillo_r[:Id]
      platillo.nombre = platillo_r[:nombre]
      platillo.precio = platillo_r[:precio]
      platillo.descripcion = platillo_r[:descripcion]
      platillo.save!
    end
  end
end
