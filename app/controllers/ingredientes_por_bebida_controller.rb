class IngredientesPorBebidaController < ApplicationController
  def index

    @ingredientes_por_bebida = IngredientePorBebida.using(:dwh_t).where(error: true)
  end

  def edit
    @ingrediente_por_bebida = IngredientePorBebida.using(:dwh_t).find(params[:id])
  end

  def update
    @ingrediente_por_bebida = IngredientePorBebida.using(:dwh_t).find(params[:id])
    if @ingrediente_por_bebida.update(ingrediente_por_bebida_params)
      flash[:notice] = 'Actualizado'
      redirect_to ingredientes_por_bebida_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def ingrediente_por_bebida_params
    params.require(:ingrediente_por_bebida).permit(:id_bebida, :id_producto, :id_tipo_medida, :cantidad)
  end
end
