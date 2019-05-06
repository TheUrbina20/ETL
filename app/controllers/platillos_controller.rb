class PlatillosController < ApplicationController
  def index
    @platillos = Platillo.using(:dwh_t).where(error: true)
  end

  def edit
    @platillo =Platillo.using(:dwh_t).find(params[:id])
  end

  def destroy
    @platillo =Platillo.using(:dwh_t).find(params[:id])
    if @platillo.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to platillos_path
  end

  def update
    @platillo =Platillo.using(:dwh_t).find(params[:id])
    if validate_attributes && @platillo.update(platillo_params)
      @platillo.update_attributes(error: false)
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

  def validate_attributes
    valid_price?(params[:platillo][:precio]) && valid_nombrecosas?(params[:platillo][:nombre])
  end

end
