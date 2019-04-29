class RecibosDeComprasController < ApplicationController
  def index
    initialize_recibos
    if current_user.admin?
      @recibos = ReciboDeCompra.using(:dwh_t).where(error: true)
    elsif current_user.hotel?
      @recibos = ReciboDeCompra.using(:dwh_t).where(sistema: 'H', error: true)
    elsif current_user.rrhh?
      @recibos = ReciboDeCompra.using(:dwh_t).where(sistema: 'RR', error: true)
    else
      @recibos = ReciboDeCompra.using(:dwh_t).where(sistema: 'R', error: true)
    end
  end

  def edit
    @recibo_compra = ReciboDeCompra.using(:dwh_t).find(params[:id])
  end

  def update
    @recibo_compra = ReciboDeCompra.using(:dwh_t).find(params[:id])
    if @recibo_compra.update(recibo_de_compra_params)
      flash[:notice] = 'Actualizado'
      redirect_to recibos_de_compras_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def recibo_de_compra_params
    params.require(:recibo_de_compra).permit(:id_sistema, :sistema, :id_pedido_compra, :f_entrega)
  end

  def initialize_recibos
    ReciboDeCompra.using(:dwh_t).delete_all
    recibo = ReciboDeCompra.using(:dwh_t).new

    recibos = ReciboDeCompra.using(:rrhh).all
    recibos.each do |recibo_r|
      recibo = ReciboDeCompra.using(:dwh_t).new
      recibo.id_sistema = recibo_r.id
      recibo.sistema = 'RR'
      recibo.id_pedido_compra = recibo_r.id_pedido_compra
      recibo.f_entrega = recibo_r.f_entrega
      unless valid_date?(recibo.f_entrega)
        recibo.error = true
      end
      recibo.save!
    end

    recibos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Recibo_rm']
    recibos.each do |recibo_r|
      recibo = ReciboDeCompra.using(:dwh_t).new
      recibo.id_sistema = recibo_r[:Id]
      recibo.id_pedido_compra = recibo_r[:id_pedido]
      recibo.f_entrega = recibo_r[:fecha]
      recibo.sistema = 'R'
      recibo.save!
    end
  end
end
