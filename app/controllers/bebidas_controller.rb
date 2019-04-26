class BebidasController < ApplicationController
  def index
    initialize_bebidas
    @bebidas = Bebida.using(:dwh_t).all
  end

  private

  def initialize_bebidas
    Bebida.using(:dwh_t).delete_all
    bebidas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Bebidas']

    bebidas.each do |bebida_r|
      bebida = Bebida.using(:dwh_t).new

      bebida.id = bebida_r[:Id]
      bebida.nombre = bebida_r[:nombre]
      bebida.precio = bebida_r[:precio]
      bebida.descripcion = bebida_r[:descripcion]
      bebida.save!
    end
  end
end
