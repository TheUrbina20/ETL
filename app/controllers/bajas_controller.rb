class BajasController < ApplicationController
  def index
    initialize_bajas
    @bajas = Baja.using(:dwh_t).where(error: true)
  end

  def edit
    @baja = Baja.using(:dwh_t).find(params[:id])
  end

  def update
    @baja = Baja.using(:dwh_t).find(params[:id])
    if @baja.update(baja_params)
      flash[:notice] = 'Actualizado'
      redirect_to bajas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def baja_params
    params.require(:baja).permit(:id_artiuclo, :fecha, :tipo, :motivo)
  end
  private

  def initialize_bajas
    Baja.using(:dwh_t).delete_all

    bajas = Baja.using(:rrhh).all
    baja = Baja.using(:dwh_t).new

    bajas.each do |baja_r|
      baja = Baja.using(:dwh_t).new
      baja.id = baja_r.id
      baja.id_articulo = baja_r.id_articulo
      baja.tipo = baja_r.tipo
      baja.fecha = baja_r.fecha
      baja.motivo = baja_r.motivo

      unless valid_word?(baja.tipo)
        baja.error = true
      end
      unless valid_date?(baja.fecha)
        baja.error = true
      end
      baja.save!
    end
  end
end
