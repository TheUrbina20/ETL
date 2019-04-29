class IngredientesController < ApplicationController
  def index
    initialize_ingredientes
    @ingredientes = Ingrediente.using(:dwh_t).all
  end

  def edit
    @ingrediente = Ingrediente.using(:dwh_t).find(params[:id])
  end

  def update
    @ingrediente = Ingrediente.using(:dwh_t).find(params[:id])
    if @ingrediente.update(ingrediente_params)
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

  def initialize_ingredientes
    Ingrediente.using(:dwh_t).delete_all
    ingrediente = Ingrediente.using(:dwh_t).new
    ingredientes = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Productos']

    ingredientes.each do |ingrediente_r|
      ingrediente = Ingrediente.using(:dwh_t).new

      ingrediente.id = ingrediente_r[:Id]
      ingrediente.id_tipo = ingrediente_r[:id_tipo_p]
      ingrediente.id_tipo_cantidad = ingrediente_r[:id_tipo_cad]
      ingrediente.nombre = ingrediente_r[:nombre]
      ingrediente.stock_minimo = ingrediente_r[:stock_min]
      ingrediente.stock_maximo = ingrediente_r[:stock_max]
      ingrediente.cantidad_stock = ingrediente_r[:cantidad]
      unless valid_name?(ingrediente.nombre)
        ingrediente.error = true
      end
      unless valid_number?(ingrediente.stock_maximo)
        ingrediente.error = true
      end
      unless valid_number?(ingrediente.stock_minimo)
        ingrediente.error = true
      end
      unless valid_number?(ingrediente.cantidad_stock)
        ingrediente.error = true
      end
      ingrediente.save!

    end
  end
end
