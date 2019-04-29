class PlatillosController < ApplicationController
  def index
    initialize_platillo
    @platillos = Platillo.using(:dwh_t).all
  end

  def edit
    @platillo =Platillo.using(:dwh_t).find(params[:id])
  end

  def update
    @platillo =Platillo.using(:dwh_t).find(params[:id])
    if @platillo.update(platillo_params)
      flash[:notice] = 'Actualizado'
      redirect_to platillos_path
    else
      flash.now[:alert] = 'Error actualizado'
      render 'edit'
    end
  end

  def platillo_params
    params.require(:platillo).permit(:nombre, :precio, :descripcion)
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
      unless valid_name?(platillo.nombre)
        platillo.error = true
      end
      unless valid_number?(platillo.precio)
        platillo.error = true
      end
      platillo.save!
    end
  end
end
