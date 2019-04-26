class BebidasPorComandaController < ApplicationController
  def index
    initialize_bebidas
    @bebidas = BebidaPorComanda.using(:dwh_t).all
  end

  private

  def initialize_bebidas
    BebidaPorComanda.using(:dwh_t).delete_all

    bebidas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Bebida_comanda']

    bebidas.each do |bebida_r|
      bebida = BebidaPorComanda.using(:dwh_t).new()

      bebida.id = bebida_r[:Id]
      bebida.id_comanda = bebida_r[:id_comanda]
      bebida.id_bebida = bebida_r[:id_bebida]
      bebida.cantidad = bebida_r[:cliente]
      bebida.save!
    end

  end
end
