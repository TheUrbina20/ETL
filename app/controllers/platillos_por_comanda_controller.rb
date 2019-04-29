class PlatillosPorComandaController < ApplicationController
  def index
    initialize_platillos_por_comanda
    @platillos_por_comanda = PlatilloPorComanda.using(:dwh_t).all
  end

  def edit
    @platillo_por_comanda = PlatilloPorComanda.using(:dwh_t).find(params[:id])
  end

  def update
    @platillo_por_comanda = PlatilloPorComanda.using(:dwh_t).find(params[:id])
    if @platillo_por_comanda.update(platillo_por_comanda_params)
      flash[:notice] = 'Actualizado'
      redirect_to platillos_por_comanda_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def platillo_por_comanda_params
    params.require(:platillo_por_comanda).permit(:id_comanda, :id_platillo, :cantidad)
  end

  def initialize_platillos_por_comanda
    PlatilloPorComanda.using(:dwh_t).delete_all
    platillos_por_comanda = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Platillo_comanda']

    platillos_por_comanda.each do |platillo_por_comanda_r|

      platillo_por_comanda = PlatilloPorComanda.using(:dwh_t).new

      platillo_por_comanda.id = platillo_por_comanda_r[:Id]
      platillo_por_comanda.id_platillo = platillo_por_comanda_r[:id_platillo]
      platillo_por_comanda.id_comanda = platillo_por_comanda_r[:id_comanda]
      platillo_por_comanda.cantidad = platillo_por_comanda_r[:cantidad]
      platillo_por_comanda.save!
    end
  end
end
