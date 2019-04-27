class IngredientesPorProveedorController < ApplicationController
  def index
    initialize_ingredientes_por_proveedor
    @ingredientes_por_proveedor = IngredientePorProveedor.using(:dwh).all
  end
  def initialize_ingredientes_por_proveedor
    IngredientePorProveedor.using(:dwh_t).delete_all
    ingredientes_por_proveedor = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Producto_proveedor']

    ingredientes_por_proveedor.each do |ingrediente_por_proveedor_r|
      ingrediente_por_proveedor = IngredientePorProveedor.using(:dwh_t).new

      ingrediente_por_proveedor.id = ingrediente_por_proveedor_r[:Id]
      ingrediente_por_proveedor.id_ingrediente = ingrediente_por_proveedor_r[:id_producto]
      ingrediente_por_proveedor.id_proveedor = ingrediente_por_proveedor_r[:id_proveedor]
      ingrediente_por_proveedor.precio = ingrediente_por_proveedor_r[:precio]
      ingrediente_por_proveedor.save!
    end
  end
end
