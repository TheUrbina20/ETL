class IngredientesPorBebidaController < ApplicationController
  def index
    initialize_ingredientes_por_bebida
    @ingredientes_por_bebida = IngredientePorBebida.using(:dwh_t).where(error: true)
  end

  def edit
    @ingrediente_por_bebida = IngredientePorBebida.using(:dwh_t).find(params[:id])
  end

  def update
    @ingrediente_por_bebida = IngredientePorBebida.using(:dwh_t).find(params[:id])
    if @ingrediente_por_bebida.update(ingrediente_por_bebida_params)
      flash[:notice] = 'Actualizado'
      redirect_to ingredientes_por_bebida_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def ingrediente_por_bebida_params
    params.require(:ingrediente_por_bebida).permit(:id_bebida, :id_producto, :id_tipo_medida, :cantidad)
  end

  private

  def initialize_ingredientes_por_bebida
    IngredientePorBebida.using(:dwh_t).delete_all

    ingredientes = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Ingrediente_por_bebida']

    ingredientes.each do |ingrediente_r|
      ingrediente = IngredientePorBebida.using(:dwh_t).new

      ingrediente.id = ingrediente_r[:Id]
      ingrediente.id_bebida = ingrediente_r[:id_bebida]
      ingrediente.id_producto = ingrediente_r[:id_producto]
      ingrediente.id_tipo_medida = ingrediente_r[:id_tipo_med]
      ingrediente.cantidad = ingrediente_r[:cantidad]
      unless valid_number?(ingrediente.cantidad)
        ingrediente.error = true
      end
      ingrediente.save!

    end

  end
end
