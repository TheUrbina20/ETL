class BebidasPorComandaController < ApplicationController
  def index
    initialize_bebidas
    @bebidas = BebidaPorComanda.using(:dwh_t).where(error: true)
  end

  def edit
    @bebida_por_comanda = BebidaPorComanda.using(:dwh_t).find(params[:id])
  end

  def update
    @bebida_por_comanda = BebidaPorComanda.using(:dwh_t).find(params[:id])
    if @bebida_por_comanda.update(bebida_por_comanda_params)
      flash[:notice] = 'Actualizado'
      redirect_to bebidas_por_comanda_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def bebida_por_comanda_params
    params.require(:bebida_por_comanda).permit(:id_comanda, :id_bebida, :cantidad)
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
      bebida.cantidad = bebida_r[:cantidad]
      unless valid_number?(bebida.cantidad)
        bebida.error = true
      end
      bebida.save!
    end

  end
end
