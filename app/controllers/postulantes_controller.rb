class PostulantesController < ApplicationController
  def index

    @postulantes = Postulante.using(:dwh_t).where(error: true)
  end

  def edit
    @postulantes = Postulante.using(:dwh_t).find(params[:id])
  end

  def destroy
    @postulantes = Postulante.using(:dwh_t).find(params[:id])
    if @postulantes.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to postulantes_path
  end

  def update
    @postulantes = Postulante.using(:dwh_t).find(params[:id])

    if @postulantes.update(postulantes_params)
      flash[:notice] = 'Actualizado Correctamente'
      redirect_to postulantes_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def postulantes_params
    params.require(:postulante).permit(:id, :nombre, :estado)
  end

  private

end
