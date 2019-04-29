class IngredientesPorProveedorController < ApplicationController
  def index
    initialize_ingredientes_por_proveedor
    @ingredientes_por_proveedor = IngredientePorProveedor.using(:dwh_t).all
  end

  def edit
    @ingrediente_por_proveedor = IngredientePorProveedor.using(:dwh_t).find(params[:id])
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


  def initialize_ingredientes_por_proveedor
    IngredientePorProveedor.using(:dwh_t).delete_all
    ingredientes_por_proveedor = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Producto_proveedor']

    ingredientes_por_proveedor.each do |ingrediente_por_proveedor_r|
      ingrediente_por_proveedor = IngredientePorProveedor.using(:dwh_t).new

      ingrediente_por_proveedor.id = ingrediente_por_proveedor_r[:Id]
      ingrediente_por_proveedor.id_ingrediente = ingrediente_por_proveedor_r[:id_producto]
      ingrediente_por_proveedor.id_proveedor = ingrediente_por_proveedor_r[:id_proveedor]
      ingrediente_por_proveedor.precio = ingrediente_por_proveedor_r[:precio]
      unless valid_price?(ingrediente_por_proveedor.precio)
        ingrediente_por_proveedor.error = true
      end
      ingrediente_por_proveedor.save!
    end
  end
end
