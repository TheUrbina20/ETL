class TiposDeProductosController < ApplicationController
  def index

    @tipos_de_productos = TipoDeProducto.using(:dwh_t).where(error: true)
  end

  def edit
    @tipo_de_producto = TipoDeProducto.using(:dwh_t).find(params[:id])
  end

  def destroy
    @tipo_de_producto = TipoDeProducto.using(:dwh_t).find(params[:id])
    if @tipo_de_producto.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to tipos_de_productos_path
  end

  def update
    @tipo_de_producto = TipoDeProducto.using(:dwh_t).find(params[:id])
    if validate_attributes && @tipo_de_producto.update(tipo_de_producto_params)
      @tipo_de_producto.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to tipos_de_productos_path
    else
      flash.now[:alert] = 'Error actuaizando'
      render 'edit'
    end
  end

  def tipo_de_producto_params
    params.require(:tipo_de_producto).permit(:tipo)
  end

  def validate_attributes
    valid_nombrecosas?(@tipo_de_producto.tipo)
  end

end
