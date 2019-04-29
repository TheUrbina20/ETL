class TiposMedidasController < ApplicationController
  def index
    initialize_tipos_medidas
    @tipos_medidas = TipoMedida.using(:dwh_t).where(error: true)
  end

  def edit
    @tipo_medida = TipoMedida.using(:dwh_t).find(params[:id])
  end

  def update
    @tipo_medida = TipoMedida.using(:dwh_t).find(params[:id])

    if @tipo_medida.update(tipo_medidas_params)
      flash[:notice] = 'Actualizado correctamente'
      redirect_to tipos_medidas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def tipo_medidas_params
    params.require(:tipo_medida).permit(:nombre)
  end

  def initialize_tipos_medidas
    TipoMedida.using(:dwh_t).delete_all

    tipos_medidas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Tipo_medida']

    tipos_medidas.each do |tipo_medida_r|
      tipo_medida = TipoMedida.using(:dwh_t).new
      tipo_medida.id = tipo_medida_r[:Id]
      tipo_medida.nombre = tipo_medida_r[:nombre]
      unless valid_name?(tipo_medida.nombre)
        tipo_medida.error = true
      end
      tipo_medida.save!
    end
  end
end
