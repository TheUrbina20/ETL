class IngredientesPorPlatilloController < ApplicationController
  def index

    @ingredientes_por_platillo = IngredientePorPlatillo.using(:dwh_t).where(error: true)
  end

  def edit
    @ingrediente_por_platillo = IngredientePorPlatillo.using(:dwh_t).find(params[:id])
  end

  def destroy
    @ingrediente_por_platillo = IngredientePorPlatillo.using(:dwh_t).find(params[:id])
    if @ingrediente_por_platillo.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to ingredientes_por_platillo_index_path
  end

  def update
    @ingrediente_por_platillo = IngredientePorPlatillo.using(:dwh_t).find(params[:id])
    if @ingrediente_por_platillo.update(ingrediente_por_platillo_param)
      flash[:notice] = 'Actualizado'
      redirect_to ingredientes_por_platillo_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def ingrediente_por_platillo_param
    params.require(:ingrediente_por_platillo).permit(:id_platillo, :id_producto, :id_tipo_medida, :cantidad)
  end

end
