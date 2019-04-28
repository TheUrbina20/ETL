class BebidasController < ApplicationController
  def index
    initialize_bebidas
    @bebidas = Bebida.using(:dwh_t).all
  end

  def edit
    @bebida = Bebida.using(:dwh_t).find(params[:id])
  end

  def update
    @bebida = Bebida.using(:dwh_t).find(params[:id])
    if @bebida.update(bebida_params)
      flash[:notice] = 'Actualizado'
      redirect_to bebidas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def bebida_params
    params.require(:bebida).permit(:nombre, :precio, :descripcion)
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
