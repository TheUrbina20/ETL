class RecibosDeComprasController < ApplicationController
  def index
    initialize_recibos
    @recibos = ReciboDeCompra.using(:dwh_t).all
  end

  def initialize_recibos
    ReciboDeCompra.using(:dwh_t).delete_all

    recibos = ReciboDeCompra.using(:rrhh).all
    recibos.each do |recibo_r|
      recibo = ReciboDeCompra.using(:dwh_t).new()
      recibo.id = recibo_r.id
      recibo.id_pedido_compra = recibo_r.id_pedido_compra
      recibo.f_generacion = recibo_r.f_generacion
      recibo.f_entrega = recibo_r.f_entrega
      recibo.save!
    end
  end
end
