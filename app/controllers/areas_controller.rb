class AreasController < ApplicationController
  def index
    @areas = Area.using(:dwh_t).where(error: true)
  end

  def edit
    @areas = Area.using(:dwh_t).find(params[:id])
  end

  def destroy
    @areas = Area.using(:dwh_t).find(params[:id])
    if @areas.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to areas_path
  end

  def update
    @areas = Area.using(:dwh_t).find(params[:id])
    if validate_attributes && @areas.update(areas_params)
      @areas.update_attributes(error: false)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to areas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end
  #  FUNCTION TO DELETE ALL RECORDS WITH ERRORS
  def delete_with_errors_areas
   Area.using(:dwh_t).where(error: true).delete_all
   redirect_to root_path
  end
  #

  def areas_params
    params.require(:area).permit(:id, :nombre, :clave)
  end

  def validate_attributes
    valid_nombrecosas?(params[:area][:nombre])
  end

end
