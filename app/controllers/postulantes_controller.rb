class PostulantesController < ApplicationController
  def index
    initialice_postulantes
    @postulantes = Postulante.using(:dwh_t).all
  end

  def edit
    @postulantes = Postulante.using(:dwh_t).find(params[:id]) 
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

  def initialice_postulantes
    Postulante.using(:dwh_t).delete_all
    postulantes = Postulante.using(:rrhh).all

    postulantes.each do |postulante_r|
      postulante = Postulante.using(:dwh_t).new()

      postulante.id = postulante_r.id
      postulante.nombre = postulante_r.nombre
      postulante.estado = postulante_r.estado
      postulante.save!
    end
  end
end
