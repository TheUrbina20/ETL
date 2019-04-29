class PostulantesController < ApplicationController
  def index
    initialice_postulantes
    @postulantes = Postulante.using(:dwh_t).where(error: true)
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
    postulante = Postulante.using(:dwh_t).new

    postulantes.each do |postulante_r|
      postulante = Postulante.using(:dwh_t).new

      postulante.id = postulante_r.id
      postulante.nombre = postulante_r.nombre
      postulante.estado = postulante_r.estado
      unless valid_name?(postulante.nombre)
        postulante.error = true
      end
      unless valid_name?(postulante.estado.to_s)
        postulante.error = true
      end
      postulante.save!
    end
  end
end
