class IngredientesController < ApplicationController
  def index

    @ingredientes = Ingrediente.using(:dwh_t).where(error: true)
  end

  def edit
    @ingrediente = Ingrediente.using(:dwh_t).find(params[:id])
  end

  def destroy
    @ingrediente = Ingrediente.using(:dwh_t).find(params[:id])
    if @ingrediente.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to ingredientes_path
  end

  def update
    @ingrediente = Ingrediente.using(:dwh_t).find(params[:id])
    if validate_attributes && @ingrediente.update(ingrediente_params)
      @ingrediente.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to ingredientes_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def ingrediente_params
    params.require(:ingrediente).permit(:nombre, :stock_minimo, :stock_maximo, :cantidad_stock, :id_tipo, :id_tipo_cantidad)
  end

  def validate_attributes
    valid_nombrecosas?(@ingrediente.nombre) && valid_number?(@ingrediente.stock_minimo) && valid_number?(@ingrediente.stock_maximo) && valid_number?(@ingrediente.cantidad_stock)
  end
end
