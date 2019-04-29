class TiposDeProductosController < ApplicationController
  def index

    @tipos_de_productos = TipoDeProducto.using(:dwh_t).where(error: true)
  end

  def edit
    @tipo_de_producto = TipoDeProducto.using(:dwh_t).find(params[:id])
  end

  def update
    @tipo_de_producto = TipoDeProducto.using(:dwh_t).find(params[:id])
    if @tipo_de_producto.update(tipo_de_producto_params)
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

end
