class TiposDeProductosController < ApplicationController
  def index
    initialize_tipos_productos
    @tipos_de_productos = TipoDeProducto.using(:dwh_t).all
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

  def initialize_tipos_productos
    TipoDeProducto.using(:dwh_t).delete_all

    tipos_de_productos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Tipo de prodcuto']

    tipos_de_productos.each do |tipo_de_producto_r|
      tipo_de_producto = TipoDeProducto.using(:dwh_t).new

      tipo_de_producto.id = tipo_de_producto_r[:Id]
      tipo_de_producto.tipo = tipo_de_producto_r[:tipo]
      unless valid_name?(tipo_de_producto.tipo)
        tipo_de_producto.error = true
      end
      tipo_de_producto.save!

    end
  end
end
