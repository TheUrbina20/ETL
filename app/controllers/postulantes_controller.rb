class PostulantesController < ApplicationController
  def index
    initialice_postulantes
    @postulantes = Postulante.using(:dwh_t).all
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
