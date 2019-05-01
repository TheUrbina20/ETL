class TiposMedidasController < ApplicationController
  def index

    @tipos_medidas = TipoMedida.using(:dwh_t).where(error: true)
  end

  def edit
    @tipo_medida = TipoMedida.using(:dwh_t).find(params[:id])
  end

  def destroy
    @tipo_medida = TipoMedida.using(:dwh_t).find(params[:id])
    if @tipo_medida.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to tipos_medidas_path
  end

  def update
    @tipo_medida = TipoMedida.using(:dwh_t).find(params[:id])
    @tipo_medida.update(tipo_medidas_params)

    if validate_attributes 
      @tipo_medida.update_attributes(error: false)
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
  

  def validate_attributes 
    valid_nombrecosas?(@tipo_medida.nombre)
  end

end
