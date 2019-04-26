class IngredientesPorBebidaController < ApplicationController
  def index
    initialize_ingredientes_por_bebida
    @ingredientes_por_bebida = IngredientePorBebida.using(:dwh_t).all
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
      ingrediente.save!

    end

  end
end
