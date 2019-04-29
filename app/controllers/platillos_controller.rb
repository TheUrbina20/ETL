class PlatillosController < ApplicationController
  def index
    @platillos = Platillo.using(:dwh_t).where(error: true)
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

end
