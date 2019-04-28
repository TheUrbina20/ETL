class MesasController < ApplicationController
  def index
    initialize_mesas
    @mesas = Mesa.using(:dwh_t).all
  end

  def edit
    @mesa = Mesa.using(:dwh_t).find(params[:id])
  end

  def update
    @mesa = Mesa.using(:dwh_t).find(params[:id])
    if @mesa.update(mesa_params)
      flash[:notice] = 'Actualizado'
      redirect_to mesas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def mesa_params
    params.require(:mesa).permit(:numero, :capacidad)
  end

  private

  def initialize_mesas
    Mesa.using(:dwh_t).delete_all
    mesas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Mesa']
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
