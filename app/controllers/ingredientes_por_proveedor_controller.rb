class IngredientesPorProveedorController < ApplicationController
  def index

    @ingredientes_por_proveedor = IngredientePorProveedor.using(:dwh_t).where(error: true)
  end

  def edit
    @ingrediente_por_proveedor = IngredientePorProveedor.using(:dwh_t).find(params[:id])
  end

  def destroy
    @ingrediente_por_proveedor = IngredientePorProveedor.using(:dwh_t).find(params[:id])
    if @areingrediente_por_proveedoras.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to ingredientes_por_proveedor_index_path
  end

  def update
    @ingrediente_por_proveedor = IngredientePorProveedor.using(:dwh_t).find(params[:id])
    if @ingrediente_por_proveedor.update(ingrediente_por_proveedor_params)
      flash[:notice] = 'Actualizado'
      redirect_to ingredientes_por_proveedor_index_path
    else
      flash.now[:alert]
      render 'edit'
    end
  end

  def ingrediente_por_proveedor_params
    params.require(:ingrediente_por_proveedor).permit(:id_proveedor, :id_ingrediente, :precio)
  end
end
