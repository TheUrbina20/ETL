class TiposDeProductosController < ApplicationController
  def index
    initialize_tipos_productos
    @tipos_de_productos = TipoDeProducto.using(:dwh_t).all
  end

  def initialize_tipos_productos
    TipoDeProducto.using(:dwh_t).delete_all

    tipos_de_productos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Tipo de prodcuto']

    tipos_de_productos.each do |tipo_de_producto_r|
      tipo_de_producto = TipoDeProducto.using(:dwh_t).new

      tipo_de_producto.id = tipo_de_producto_r[:Id]
      tipo_de_producto.tipo = tipo_de_producto_r[:tipo]
      tipo_de_producto.save!

    end
  end
end
